import 'package:stacked/stacked.dart';
import 'package:taodan/common/apis/api_user.dart';

class InviteViewModel extends BaseViewModel {
  String inviteCode = '';

  invite() {
    UserAPI.bindInvite(inviteCode, (data) {});
  }
}
