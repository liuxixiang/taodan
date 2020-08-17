import 'package:dio/dio.dart';

/// header拦截器
class HeaderInterceptor extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async {
    ///超时
    return options;
  }
}
