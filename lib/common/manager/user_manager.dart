import 'package:taodan/common/config/keys.dart';
import 'package:taodan/common/manager/context_manager.dart';
import 'package:taodan/model/user_entity.dart';
import 'package:taodan/router/navigator_util.dart';
import 'package:taodan/utils/json_util.dart';
import 'package:taodan/utils/shared_preferences.dart';

class UserManager {
  String _authorization;
  String _secretKey;

  UserInfoEntity _userInfo;

  UserManager._();

  factory UserManager.getInstance() => _instance;
  static final _instance = UserManager._();

  Future<String> get authorization async {
    _authorization =
        _authorization ?? await SpUtil.instance.get(Keys.AUTH);
    return _authorization;
  }

  Future<String> get secretKey async {
    _secretKey = _secretKey ?? await SpUtil.instance.get(Keys.SECRET_KEY);
    return _secretKey;
  }

  Future<UserInfoEntity> get userInfo async {
    _userInfo = _userInfo ?? await SpUtil.instance.get(Keys.USER_INFO);
    return _userInfo;
  }

  ///检查登陆
  Future<bool> checkLogin() async {
    bool login = await isLogin();
    if (!login) {
      NavigatorUtil.goLogin(ContextManager.context);
    }
    return login;
  }

  ///判断是否登录
  Future<bool> isLogin() async {
    return !(await authorization).isNotEmpty;
  }


  saveAuth(String auth) async {
    _authorization = auth;
    if (_authorization.isEmpty) {
      await SpUtil.instance.remove(Keys.AUTH);
    } else {
      await SpUtil.instance.putString(Keys.AUTH, _authorization);
    }
    // 发送登录成功通知
    // EventBusUtils.sendEvent(
    //     new Event(EventCode.LOGIN_STATE_CHANGED, new LoginEventBean(true)));
  }

  saveUserInfo(UserInfoEntity userInfo) {
    _userInfo = userInfo;
    if (_userInfo == null) {
      SpUtil.getInstance().remove(Keys.USER_INFO);
    } else {
      SpUtil.getInstance()
          .putString(Keys.USER_INFO, JsonUtil.encodeObj(userInfo));
    }
  }


  saveSecretKey(String secretKey) async {
    _secretKey = secretKey;
    if (_secretKey.isEmpty) {
      await SpUtil.instance.remove(Keys.SECRET_KEY);
    } else {
      await SpUtil.instance.putString(Keys.SECRET_KEY,secretKey);
    }
  }

}
