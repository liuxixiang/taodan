import 'package:flutter/material.dart';
import 'package:taodan/common/config/keys.dart';
import 'package:taodan/common/manager/user_manager.dart';
import 'package:taodan/model/user_info_entity.dart';
import 'package:taodan/utils/json_util.dart';
import 'package:taodan/utils/shared_preferences.dart';

class UserState extends ChangeNotifier {
  UserInfoEntity userInfoEntity;
  bool isLogin = false;
  bool loadUserInfoBusy = false;
  getUserInfo() {
    UserManager.getInstance()
        .userInfo
        .then((value) => {userInfoEntity = value, notifyListeners()});
  }

  saveUserInfo(UserInfoEntity userInfo) {
    if (userInfo == null) {
      isLogin = false;
      SpUtil.getInstance()
          .remove(Keys.USER_INFO)
          .then((value) => {userInfoEntity = userInfo, notifyListeners()});
    } else {
      isLogin = true;
      loadUserInfoBusy = true;
      SpUtil.getInstance()
          .putString(Keys.USER_INFO, JsonUtil.encodeObj(userInfo))
          .then((value) => {userInfoEntity = userInfo, notifyListeners()});
    }
  }

  saveLoginState(bool loginState) {
    isLogin = loginState;
    notifyListeners();
  }
}
