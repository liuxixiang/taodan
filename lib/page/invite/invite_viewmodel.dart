import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:taodan/common/apis/api_user.dart';
import 'package:taodan/common/config/event_code.dart';
import 'package:taodan/state/user_state.dart';
import 'package:taodan/utils/event_bus.dart';

class InviteViewModel extends BaseViewModel {
  String _inviteCode = '';

  String get inviteCode => _inviteCode;

  invite(BuildContext context) {
    UserAPI.bindInvite(_inviteCode, (data) async {
      //登录成功后触发登录事件，页面A中订阅者会被调用
      context
          .read<UserState>()
          .saveLoginState(true);
      bus.emit(EventCode.login, data);
    });
  }

  updateInviteCode(String inviteCode) {
    _inviteCode = inviteCode;
  }
}
