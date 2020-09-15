import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:taodan/common/apis/api_account.dart';
import 'package:taodan/common/apis/api_user.dart';
import 'package:taodan/common/manager/context_manager.dart';
import 'package:taodan/model/account_info_entity.dart';
import 'package:taodan/model/user_info_entity.dart';
import 'package:taodan/state/user_state.dart';

const String _loadUserInfo = 'loadUserInfo';
const String _loadAccountInfo = 'loadAccountInfo';

class MineViewModel extends MultipleFutureViewModel {
  bool get loadUserInfoBusy => busy(_loadUserInfo);

  bool get loadAccountInfoBusy => busy(_loadAccountInfo);
  UserInfoEntity _userInfo;
  bool _isLogin;
  AccountInfoEntity _accountInfo;

  bool get isLogin => _isLogin;

  UserInfoEntity get userInfo => _userInfo;

  AccountInfoEntity get accountInfo => _accountInfo;

  @override
  Future initialise() async {
    _isLogin = Provider.of<UserState>(ContextManager.context).isLogin;
    _userInfo = Provider.of<UserState>(ContextManager.context).userInfo;
    return super.initialise();
  }

  Future<UserInfoEntity> getUserInfo() async {
    if (_isLogin) {
      await UserAPI.findUser((data) => {
            if (data != null)
              {
                _userInfo = data,
              }
          });
    }
    return _userInfo;
  }

  Future<AccountInfoEntity> getAccountInfo() async {
    if (_isLogin) {
      await AccountAPI.queryAccountInfo((data) => {
            if (data != null)
              {
                // userInfo = data,
              }
          });
    }
    return _accountInfo;
  }

  @override
  // TODO: implement futuresMap
  Map<String, Future Function()> get futuresMap =>
      {_loadUserInfo: getUserInfo, _loadAccountInfo: getAccountInfo};
}
