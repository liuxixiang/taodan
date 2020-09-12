import 'package:taodan/api/http_utils.dart';

import 'api_path.dart';
import 'apis.dart';

class ConfigApi {
  static getConfigs<T>(String code, OnNetSuccess<T> onNetSuccess) async {
    await HttpUtils.instance.requestNetwork(
      Method.get,
      ApiPath.configs,
      // params: {
      //   'code': code,
      //   'mobile': mobile,
      //   'loginType': 'mobile',
      // },
      // onSuccess: (code, msg, data) {
      //   onNetSuccess.call(LoginEntity.fromJson(data));
      // },
    );
  }

  static getConfig<T>(String code, OnNetSuccess<T> onNetSuccess) async {
    await HttpUtils.instance
        .requestNetwork(Method.get, ApiPath.config + "?code=" + code,
            // params: {'code': code},
            onSuccess: (code, msg, data) {
      print("data===" + data);
      // onNetSuccess.call(LoginEntity.fromJson(data));
    });
  }
}
