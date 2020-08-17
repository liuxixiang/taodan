import 'package:dio/dio.dart';
import 'package:taodan/config/config.dart';
import 'package:taodan/utils/shared_preferences.dart';

/// Token拦截器
class TokenInterceptors extends InterceptorsWrapper {
  String _token;

  @override
  onRequest(RequestOptions options) async {
    //授权码
    if (_token == null) {
      var authorizationCode = await getAuthorization();
      if (authorizationCode != null) {
        _token = authorizationCode;
      }
    }
    options.headers[ConfigKey.KEY_HEADER_AUTHORIZATION] = _token;
    return options;
  }

  @override
  onResponse(Response response) async {
    try {
      var responseJson = response.data;
      if (response.statusCode == 201 &&
          responseJson[ConfigKey.KEY_TOKEN] != null) {
        _token = ConfigKey.KEY_TOKEN + ' ' + responseJson[ConfigKey.KEY_TOKEN];
        SpUtil.instance.putString(ConfigKey.KEY_TOKEN, _token);
      }
    } catch (e) {
      print(e);
    }
    return response;
  }

  ///清除授权
  clearAuthorization() {
    this._token = null;
    SpUtil.instance.remove(ConfigKey.KEY_TOKEN);
  }

  ///获取授权token
  getAuthorization() async {
    String token = await SpUtil.instance.get(ConfigKey.KEY_TOKEN);
    this._token = token;
    return token;
  }
}
