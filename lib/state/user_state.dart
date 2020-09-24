import 'package:flutter/material.dart';
import 'package:taodan/common/Global.dart';
import 'package:taodan/common/config/keys.dart';
import 'package:taodan/common/manager/user_manager.dart';
import 'package:taodan/model/user_info_entity.dart';
import 'package:taodan/utils/json_util.dart';
import 'package:taodan/utils/shared_preferences.dart';

class UserState extends ChangeNotifier {
  UserInfoEntity get userInfo => Global.userInfo;

  bool get isLogin => Global.isLogin;

  saveUserInfo(UserInfoEntity userInfo) async {
    if (userInfo != null) {
      await UserManager.getInstance().saveUserInfo(userInfo);
      Global.userInfo = userInfo;
      notifyListeners();
    }
  }

  saveLoginState(bool loginState) async {
    UserManager.getInstance().saveLogin(loginState);
    Global.isLogin = await UserManager.getInstance().isLogin;
    notifyListeners();
  }

  clearLogin() {
    UserManager.getInstance().saveUserInfo(null);
    UserManager.getInstance().saveLogin(false);
    UserManager.getInstance().saveAuth("");
    UserManager.getInstance().saveSecretKey("");
  }
}
