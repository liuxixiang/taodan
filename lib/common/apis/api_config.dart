import 'package:taodan/api/http_utils.dart';
import 'package:taodan/model/task_type.dart';

import 'api_path.dart';
import 'apis.dart';

class ConfigApi {
  static getConfigs<T>(String code, OnNetSuccess<T> onNetSuccess) async {
    await HttpUtils.instance.requestNetwork(
      Method.get,
      ApiPath.common.configs,
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

  static getConfig(
      String code, OnNetSuccess<List<TaskType>> onNetSuccess) async {
    await HttpUtils.instance.requestNetwork(Method.get, ApiPath.common.config,
        // params: {'code': code},
        queryParameters: {
          "paramCode": code,
          "appId": "taodan",
          "appVersion": "1.0.0",
          "configVersion": "0",
          "osType": "android"
        }, onSuccess: (code, msg, data) {
      print("data===" + data);
      onNetSuccess.call(TaskType.taskTypesFromJson(data));
      // onNetSuccess.call();
      // onNetSuccess.call(LoginEntity.fromJson(data));
    });
  }
}
