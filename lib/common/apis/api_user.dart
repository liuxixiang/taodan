import 'package:taodan/api/http_utils.dart';
import 'package:taodan/common/apis/apis.dart';
import 'package:taodan/common/manager/user_manager.dart';
import 'package:taodan/model/user_entity.dart';

import 'api_path.dart';

/// 用户
class UserAPI {
  static login(String code, String mobile,
      OnNetSuccess<UserInfoEntity> onNetSuccess) async {
    await HttpUtils.instance.requestNetwork(
      Method.post,
      ApiPath.login,
      params: {
        'appId': "taodan",
        'createdBy': code,
        'loginNo': mobile,
        'loginType': 'app',
      },
      onSuccess: (code, msg, data) {
        onNetSuccess.call(UserInfoEntity.fromJson(data));
      },
    );
  }

  static findUser(String code, String mobile,
      OnNetSuccess<UserInfoEntity> onNetSuccess) async {
    await HttpUtils.instance.requestNetwork(
      Method.get,
      ApiPath.findUser,
      onSuccess: (code, msg, data) {
        onNetSuccess.call(UserInfoEntity.fromJson(data));
      },
    );
  }
}
