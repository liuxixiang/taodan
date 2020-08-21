import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:taodan/config/keys.dart';
import 'package:taodan/utils/date_util.dart';

/// sign拦截器
class SignInterceptor extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async {
    String secretkey = "";
    int ts = DateUtils.getNowDateMs();
    String nonce = "";
    if (secretkey.isNotEmpty) {
      Map<String, dynamic> map = SplayTreeMap();
      String method = options.method;
      String path = options.path;
      String body = "";
      map['method'] = method;
      map['ts'] = ts;
      map['nonce'] = nonce;
      map['path'] = path;
      map['body'] = body;
    }
//    options.headers[Keys.APP_TIMESTAMP_KEY] = ts;
//    options.headers[Keys.NONCE_KEY] = nonce;
//    options.headers[Keys.SIGNATURE_KEY] = '';
    return options;
  }
}
