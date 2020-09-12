import 'package:stacked/stacked.dart';
import 'package:taodan/common/apis/api_user.dart';

class UpdateInfoViewModel extends BaseViewModel {
  String _info;

  String get info => _info;

  void updateString(String value) {
    _info = value;
    notifyListeners();
  }

  updateInfo() {
    UserAPI.bindInvite(info, (data) {});
  }
}
