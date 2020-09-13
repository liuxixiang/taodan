import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:taodan/common/apis/api_user.dart';
import 'package:taodan/router/navigator_util.dart';
import 'package:taodan/utils/toast_utils.dart';

class UpdateInfoViewModel extends BaseViewModel {
  String _info;

  String get info => _info;

  void updateString(String value) {
    _info = value;
    notifyListeners();
  }

  updateInfo(BuildContext context) {
    UserAPI.updateUserInfo((data) {
      NavigatorUtil.goBack(context);
      ToastUtils.showCenterToast(data);
    }, name: info);
  }
}
