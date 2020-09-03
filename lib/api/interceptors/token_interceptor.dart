import 'package:dio/dio.dart';
import 'package:taodan/common/config/keys.dart';
import 'package:taodan/common/manager/user_manager.dart';
import 'package:taodan/utils/shared_preferences.dart';

/// Token拦截器
class TokenInterceptors extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async {
    options.headers[Keys.AUTH] = await UserManager.getInstance().authorization;
    return options;
  }
}
