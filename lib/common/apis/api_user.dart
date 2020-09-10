import 'package:taodan/api/http_utils.dart';
import 'package:taodan/common/apis/apis.dart';
import 'package:taodan/common/manager/user_manager.dart';
import 'package:taodan/model/login_entity.dart';
import 'package:taodan/model/user_info_all_entity.dart';
import 'package:taodan/model/user_info_entity.dart';

import 'api_path.dart';

/// 用户
class UserAPI {
  static login(
      String code, String mobile, OnNetSuccess<LoginEntity> onNetSuccess) {
    HttpUtils.instance.requestNetwork(
      Method.post,
      ApiPath.login,
      params: {
        'loginNo': mobile,
        'loginType': 'app',
      },
      onSuccess: (code, msg, data) {
        if (onNetSuccess != null) {
          onNetSuccess(LoginEntity.fromJson(data));
        }
      },
    );
  }

  static findUser(OnNetSuccess<UserInfoAllEntity> onNetSuccess) async {
    await HttpUtils.instance.requestNetwork(
      Method.get,
      ApiPath.findUser,
      onSuccess: (code, msg, data) {
        onNetSuccess.call(UserInfoAllEntity.fromJson(data));
      },
    );
  }

  static bindInvite(
      String inviteCode, OnNetSuccess<UserInfoEntity> onNetSuccess) {
    HttpUtils.instance.requestNetwork(
      Method.post,
      ApiPath.bindInvite,
      params: {
        // 'createdBy': code,
        'inviteCode': inviteCode,
      },
      onSuccess: (code, msg, data) {
        // if (onNetSuccess != null) {
        //   onNetSuccess(UserInfoEntity.fromJson(data));
        // }
      },
    );
  }
}
