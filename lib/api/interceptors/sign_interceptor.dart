import 'dart:collection';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:taodan/common/config/keys.dart';
import 'package:taodan/common/manager/user_manager.dart';
import 'package:taodan/utils/app_utils.dart';
import 'package:taodan/utils/convert_utils.dart';
import 'package:taodan/utils/date_util.dart';
import 'package:taodan/utils/log_util.dart';
import 'package:taodan/utils/object_utils.dart';

/// sign拦截器
class SignInterceptor extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async {
    String secretkey = await UserManager.getInstance().secretKey;
    int ts = DateUtils.getNowDateMs();
    String nonce = AppUtils.uuid;
    if (ObjectUtils.isNotEmpty(secretkey)) {
      Map<String, dynamic> map = SplayTreeMap();
      String method = options.method;
      String path = options.path;
      map['method'] = method;
      map['timestamp'] = ts;
      map['nonce'] = nonce;
      map['path'] = path;
      if (ObjectUtils.isNotEmpty(options.data)) {
        map['body'] = options.data.toString();
      }
      if (ObjectUtils.isNotEmpty(options.queryParameters)) {
        map['params'] =options.queryParameters.toString();
      }

      String signature = ConvertUtils.map2url(map);
      if (ObjectUtils.isNotEmpty(signature)) {
        signature = signature.replaceAll(new RegExp(r"\s+"), "");
        var key = utf8.encode(secretkey);
        var bytes = utf8.encode(signature);
        var hmacSha1 = Hmac(sha1, key); // HMAC-SHA1
        var digest = hmacSha1.convert(bytes);
        if (digest != null) {
          LogUtil.e('secretkey==' + secretkey, tag: 'lxh');
          LogUtil.e('signature==' + signature, tag: 'lxh');
          LogUtil.e('digest==' + digest.toString(), tag: 'lxh');
          options.headers[Keys.SIGNATURE_KEY] = digest.toString();
        }
      }
    }
    options.headers[Keys.APP_TIMESTAMP_KEY] = ts;
    options.headers[Keys.NONCE_KEY] = nonce;
    return options;
  }
}
