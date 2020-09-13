import 'package:stacked/stacked.dart';
import 'package:taodan/common/apis/api_user.dart';
import 'package:taodan/common/manager/user_manager.dart';
import 'package:taodan/model/login_entity.dart';
import 'package:taodan/model/user_info_all_entity.dart';
import 'package:taodan/model/user_info_entity.dart';
import 'package:taodan/utils/log_util.dart';

const String _loadUserInfo = 'loadUserInfo';

class MineViewModel extends MultipleFutureViewModel {
  bool get loadUserInfoBusy => busy(_loadUserInfo);
  UserInfoEntity userInfo;
  bool isLogin = true;

  @override
  Future initialise() async {
    isLogin = await UserManager.getInstance().isLogin;
    userInfo = await UserManager.getInstance().userInfo;
    return super.initialise();
  }

  Future<UserInfoEntity> getUserInfo() async {
    if (isLogin) {
      await UserAPI.findUser((data) => {
            userInfo = data,
          });
    }
    return userInfo;
  }

  @override
  // TODO: implement futuresMap
  Map<String, Future Function()> get futuresMap => {_loadUserInfo: getUserInfo};
}
