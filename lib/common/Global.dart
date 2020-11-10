import 'package:taodan/common/manager/user_manager.dart';
import 'package:taodan/model/user_info_entity.dart';
import 'package:fluro/fluro.dart';


class Global {
  // 是否为release版
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");
  static UserInfoEntity userInfo = UserInfoEntity();
  static bool isLogin;
  static FluroRouter router;

  //初始化全局信息，会在APP启动时执行
  static Future init() async {
    try {
      userInfo = await UserManager.getInstance().userInfo;
      isLogin = await UserManager.getInstance().isLogin;
    } catch (e) {
      print(e);
    }
  }
}
