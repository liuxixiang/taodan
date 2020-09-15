import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:taodan/common/apis/api_user.dart';
import 'package:taodan/router/navigator_util.dart';
import 'package:taodan/utils/EventBus.dart';

class InviteViewModel extends BaseViewModel {
  String _inviteCode = '';

  String get inviteCode => _inviteCode;

  invite(BuildContext context) {
    UserAPI.bindInvite(_inviteCode, (data) {
      //登录成功后触发登录事件，页面A中订阅者会被调用
      bus.emit("login", data);
    });
  }

  updateInviteCode(String inviteCode) {
    _inviteCode = inviteCode;
  }
}
