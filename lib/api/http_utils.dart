import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:taodan/api/interceptors/error_interceptor.dart';
import 'package:taodan/api/result_data.dart';
import 'package:taodan/utils/log_util.dart';
import 'package:taodan/utils/toast_utils.dart';

import 'error_handle.dart';

/// 默认dio配置
int _connectTimeout = 15000;
int _receiveTimeout = 15000;
int _sendTimeout = 10000;
String _baseUrl;
List<Interceptor> _interceptors = [];

/// 初始化Dio配置
void setInitDio({
  int connectTimeout,
  int receiveTimeout,
  int sendTimeout,
  String baseUrl,
  List<Interceptor> interceptors,
}) {
  _connectTimeout = connectTimeout ?? _connectTimeout;
  _receiveTimeout = receiveTimeout ?? _receiveTimeout;
  _sendTimeout = sendTimeout ?? _sendTimeout;
  _baseUrl = baseUrl ?? _baseUrl;
  _interceptors = interceptors ?? _interceptors;
}

typedef NetCallback<T> = Function(int code, String msg, T data);
typedef NetOnComplete = Function();

class HttpUtils {
  static final HttpUtils _singleton = HttpUtils._();

  static HttpUtils get instance => HttpUtils();

  factory HttpUtils() => _singleton;

  static Dio _dio;

  Dio get dio => _dio;

  HttpUtils._() {
    BaseOptions _options = BaseOptions(
      connectTimeout: _connectTimeout,
      receiveTimeout: _receiveTimeout,
      sendTimeout: _sendTimeout,

      /// dio默认json解析，这里指定返回UTF8字符串，自己处理解析。（可也以自定义Transformer实现）
      responseType: ResponseType.plain,
      validateStatus: (_) {
        // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
        return true;
      },
      baseUrl: _baseUrl,
//      contentType: Headers.formUrlEncodedContentType, // 适用于post form表单提交
    );
    _dio = Dio(_options);

    /// Fiddler抓包代理配置 https://www.jianshu.com/p/d831b1f7c45b
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.findProxy = (uri) {
        //proxy all request to localhost:8888
        return 'PROXY 10.249.151.172:8888';
      };
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };

    /// 添加拦截器
    _interceptors.forEach((interceptor) {
      _dio.interceptors.add(interceptor);
    });

    /// 添加错误拦截器
    _dio.interceptors.add(ErrorInterceptors(_dio));
  }

  // 数据返回格式统一，统一处理异常
  Future<ResultData<T>> _request<T>(
    String method,
    String url, {
    dynamic data,
    Map<String, dynamic> queryParameters,
    CancelToken cancelToken,
    Options options,
  }) async {
    final Response<String> response = await _dio.request<String>(
      url,
      data: data,
      queryParameters: queryParameters,
      options: _checkOptions(method, options),
      cancelToken: cancelToken,
    );
    try {
      final String data = response.data.toString();

      /// 集成测试无法使用 isolate https://github.com/flutter/flutter/issues/24703
      /// 使用compute条件：数据大于10KB（粗略使用10 * 1024）且当前不是集成测试（后面可能会根据Web环境进行调整）
      /// 主要目的减少不必要的性能开销
      final bool isCompute = data.length > 10 * 1024;
      debugPrint('isCompute:$isCompute');
      final Map<String, dynamic> _map =
          isCompute ? await compute(parseData, data) : parseData(data);
      return ResultData<T>.fromJson(_map);
    } catch (e) {
      debugPrint(e.toString());
      return ResultData<T>(ExceptionHandle.parse_error, '数据解析错误！', null);
    }
  }

  Options _checkOptions(String method, Options options) {
    options ??= Options();
    options.method = method;
    return options;
  }

  Future requestNetwork<T>(Method method, String url,
      {NetCallback<T> onSuccess,
      NetCallback<T> onError,
      NetOnComplete onComplete,
      dynamic params,
      Map<String, dynamic> queryParameters,
      CancelToken cancelToken,
      Options options,
      bool isShowError: true}) {
    return _request<T>(
      method.value,
      url,
      data: params,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    ).then((ResultData<T> result) {
      _responseResult(result, onSuccess, onError, isShowError);
    }, onError: (dynamic e) {
      _responseError(url, e, isShowError, onError);
    }).whenComplete(() {
      //无论成功或失败都会走到这里
      if (onComplete != null) {
        onComplete();
      }
    });
  }

  /// 异步
  asyncRequestNetwork<T>(Method method, String url,
      {NetCallback<T> onSuccess,
      NetCallback<T> onError,
      NetOnComplete onComplete,
      dynamic params,
      Map<String, dynamic> queryParameters,
      CancelToken cancelToken,
      Options options,
      bool isShowError: true}) {
    return Stream.fromFuture(_request<T>(
      method.value,
      url,
      data: params,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    )).asBroadcastStream().listen((result) {
      _responseResult(result, onSuccess, onError, isShowError);
    }, onError: (dynamic e) {
      _responseError(url, e, isShowError, onError);
    }, onDone: () {
      if (onComplete != null) {
        onComplete();
      }
    });
  }

  ///网络请求
  _responseResult<T>(ResultData<T> result, NetCallback<T> onSuccess,
      NetCallback<T> onError, bool isShowError) {
    if (result.code == 0) {
      if (onSuccess != null) {
        onSuccess(result.code, result.message, result.data);
      }
    } else {
      _onError(result.code, result.message, result.data, isShowError, onError);
    }
  }

  ///网络请求异步异常
  _responseError<T>(
    String url,
    dynamic e,
    bool isShowError,
    NetCallback<T> onError,
  ) {
    _cancelLogPrint(e, url);
    final NetError error = ExceptionHandle.handleException(e);
    _onError(error.code, error.msg, null, isShowError, onError);
  }

  _cancelLogPrint(dynamic e, String url) {
    if (e is DioError && CancelToken.isCancel(e)) {
      LogUtil.e('取消请求接口： $url');
    }
  }

  _onError<T>(
      int code, String msg, T t, bool isShowError, NetCallback<T> onError) {
    if (code == null) {
      code = ExceptionHandle.unknown_error;
      msg = '未知异常';
    }
    LogUtil.e('接口请求异常： code: $code, mag: $msg');
    if (onError != null) {
      onError(code, msg, t);
    }
    if (isShowError) {
      ToastUtils.showBottomToast(msg);
    }
  }
}

Map<String, dynamic> parseData(String data) {
  return json.decode(data) as Map<String, dynamic>;
}

enum Method { get, post, put, patch, delete, head }

/// 使用拓展枚举替代 switch判断取值
extension MethodExtension on Method {
  String get value => ['GET', 'POST', 'PUT', 'PATCH', 'DELETE', 'HEAD'][index];
}
