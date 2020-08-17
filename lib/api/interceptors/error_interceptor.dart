import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:taodan/api/error_handle.dart';

import '../result_data.dart';

///是否需要弹提示
const NOT_TIP_KEY = "noTip";

/// 错误拦截
class ErrorInterceptors extends InterceptorsWrapper {
  final Dio _dio;

  ErrorInterceptors(this._dio);

  @override
  onRequest(RequestOptions options) async {
    //没有网络
    var connectivityResult = await (new Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
//      _dio.reject()
      return _dio.resolve(
          ResultData(ExceptionHandle.net_error, '网络异常，请检查你的网络！', null));
    }
    return options;
  }
}
