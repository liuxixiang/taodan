import 'package:package_info/package_info.dart';
import 'package:taodan/api/http_utils.dart';
import 'package:taodan/common/config/keys.dart';

import 'api_path.dart';
import 'apis.dart';

class ConfigApi {
  static getConfig(String code, OnNetSuccess onNetSuccess) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    await HttpUtils.instance.requestNetwork(Method.get, ApiPath.common.config,
        // params: {'code': code},
        queryParameters: {
          "paramCode": code,
          "appId": Keys.APP_ID_VALUES,
          "appVersion": packageInfo.version,
          "configVersion": "0",
          "osType": Keys.APP_CLIENT_TYPE_VALUES
        }, onSuccess: (code, msg, data) {
      onNetSuccess.call(data);
    });
  }
}
