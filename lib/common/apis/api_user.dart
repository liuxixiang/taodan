import 'package:taodan/api/http_utils.dart';
import 'package:taodan/common/apis/apis.dart';
import 'package:taodan/common/manager/context_manager.dart';
import 'package:taodan/common/manager/user_manager.dart';
import 'package:taodan/model/login_entity.dart';
import 'package:taodan/model/user_info_all_entity.dart';
import 'package:taodan/model/user_info_entity.dart';
import 'package:taodan/state/user_state.dart';
import 'package:taodan/utils/log_util.dart';
import 'package:provider/provider.dart';
import 'api_path.dart';

/// 用户
class UserAPI {
  static login(
      String code, String mobile, OnNetSuccess<LoginEntity> onNetSuccess) {
    HttpUtils.instance.requestNetwork(
      Method.post,
      ApiPath.member.login,
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

  static findUser(OnNetSuccess<UserInfoEntity> onNetSuccess) async {
    await HttpUtils.instance.requestNetwork(
      Method.get,
      ApiPath.member.findUser,
      onSuccess: (code, msg, data) async {
        if (data != null && onNetSuccess != null) {
          onNetSuccess.call(UserInfoAllEntity.fromJson(data)?.userInfoRspDto);
        }
      },
    );
  }

  static bindInvite(String inviteCode, OnNetSuccess<String> onNetSuccess) {
    HttpUtils.instance.requestNetwork(
      Method.post,
      ApiPath.member.bindInvite,
      params: {
        // 'createdBy': code,
        'inviteCode': inviteCode,
      },
      onSuccess: (code, msg, data) {
        if (onNetSuccess != null) {
          onNetSuccess(msg);
        }
      },
    );
  }

  static updateUserInfo(OnNetSuccess<String> onNetSuccess,
      {String avatarImage, String name, String six}) async {
    await HttpUtils.instance.requestNetwork(
      Method.post,
      ApiPath.member.updateUserInfo,
      params: {"avatarImage": avatarImage, "name": name, "six": six},
      onSuccess: (code, msg, data) {
        UserInfoEntity userInfoEntity = UserInfoEntity.fromJson(data);
        // _saveUserInfo(userInfoEntity);
        ContextManager.context.read<UserState>().saveUserInfo(userInfoEntity);
        onNetSuccess.call(msg);
      },
    );
  }

// static _saveUserInfo(UserInfoEntity userInfoEntity) {
//   if (userInfoEntity != null) {
//     UserManager.getInstance().saveUserInfo(userInfoEntity);
//   }
// }
}
