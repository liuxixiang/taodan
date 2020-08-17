import 'package:dio/dio.dart';
import 'package:taodan/config/config.dart';
import 'package:taodan/config/keys.dart';
import 'package:taodan/utils/shared_preferences.dart';

/// Token拦截器
class TokenInterceptors extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async {
    options.headers[Keys.AUTHORIZATION] = await getAuthorization();
    return options;
  }

  ///清除授权
  clearAuthorization() {
    SpUtil.instance.remove(Keys.AUTHORIZATION);
  }

  ///获取授权token
  getAuthorization() async {
    String token = await SpUtil.instance.get(Keys.AUTHORIZATION);
    return token;
  }
}
