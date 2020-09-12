import 'package:taodan/common/config/keys.dart';
import 'package:taodan/common/manager/context_manager.dart';
import 'package:taodan/model/login_entity.dart';
import 'package:taodan/model/user_info_entity.dart';
import 'package:taodan/router/navigator_util.dart';
import 'package:taodan/utils/json_util.dart';
import 'package:taodan/utils/log_util.dart';
import 'package:taodan/utils/object_utils.dart';
import 'package:taodan/utils/shared_preferences.dart';

class UserManager {
  String _authorization = '';
  String _secretKey = '';

  UserInfoEntity _userInfo;

  UserManager._();

  factory UserManager.getInstance() => _instance;
  static final _instance = UserManager._();

  Future<String> get authorization async {
    _authorization = ObjectUtils.isNotEmpty(_authorization)
        ? _authorization
        : await SpUtil.instance.get(Keys.AUTH);
    return _authorization;
  }

  Future<String> get secretKey async {
    _secretKey = ObjectUtils.isNotEmpty(_secretKey)
        ? _secretKey
        : await SpUtil.instance.get(Keys.SECRET_KEY);
    return _secretKey;
  }

  Future<UserInfoEntity> get userInfo async {
    _userInfo = _userInfo ??
        await SpUtil.instance
            .getObj(Keys.USER_INFO, (v) => UserInfoEntity.fromJson(v));
    return _userInfo;
  }

  Future<bool> get isLogin async {
    return ObjectUtils.isNotEmpty(await authorization) &&
        await SpUtil.instance.getBool(Keys.LOGIN);
  }

  ///检查登陆
  Future<bool> checkLogin() async {
    bool login = await isLogin;
    if (!login) {
      NavigatorUtil.goLogin(ContextManager.context, false);
    }
    return login;
  }

  saveAuth(String auth) async {
    _authorization = auth;
    if (ObjectUtils.isEmpty(_authorization)) {
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
      SpUtil.getInstance().putObject(Keys.USER_INFO, _userInfo);
    }
  }

  saveSecretKey(String secretKey) async {
    _secretKey = secretKey;
    if (ObjectUtils.isEmpty(_secretKey)) {
      await SpUtil.instance.remove(Keys.SECRET_KEY);
    } else {
      await SpUtil.instance.putString(Keys.SECRET_KEY, secretKey);
    }
  }

  saveLogin(bool isLogin) async {
    await SpUtil.instance.putBool(Keys.LOGIN, isLogin);
  }
}
