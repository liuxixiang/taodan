import 'package:package_info/package_info.dart';
import 'package:taodan/api/http_utils.dart';
import 'package:taodan/common/config/keys.dart';
import 'package:taodan/utils/log_util.dart';

import 'api_path.dart';
import 'apis.dart';

class ConfigApi {
  static const String tag = "config";

  static getConfigs(
      String code, OnNetSuccess<Map<String, dynamic>> onNetSuccess) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    await HttpUtils.instance.requestNetwork(Method.get, ApiPath.common.configs,
        // params: {'code': code},
        queryParameters: {
          "paramCodes": code,
          "appId": Keys.APP_ID_VALUES,
          "appVersion": packageInfo.version,
          "configVersion": "0",
          "osType": Keys.APP_CLIENT_TYPE_VALUES
        }, onSuccess: (code, msg, data) {
      onNetSuccess(data);
    });
  }

  ///批量修改
  static batchInsertUpdate(
      String json, OnNetSuccess<String> onNetSuccess) async {
    await HttpUtils.instance.requestNetwork(
        Method.post, ApiPath.common.batchInsertUpdate, params: json,
        onSuccess: (code, msg, data) {
      onNetSuccess.call('成功');
      LogUtil.e('成功', tag: tag);
    });
  }

  ///新增云控
  static insertConfig(String json, OnNetSuccess<String> onNetSuccess) async {
    await HttpUtils.instance
        .requestNetwork(Method.post, ApiPath.common.insertConfig, params: json,
            onSuccess: (code, msg, data) {
      onNetSuccess.call('成功');
      LogUtil.e('成功', tag: tag);
    });
  }
}
