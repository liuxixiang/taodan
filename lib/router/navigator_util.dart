import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:taodan/page/sign/sign_page.dart';
import 'package:taodan/router/application.dart';
import 'package:taodan/router/routes.dart';
import 'package:taodan/utils/assets_util.dart';

class NavigatorUtil {
  static void goLogin(BuildContext context) {
    /// replace：true 就是将 splash 页面给移除掉了，这点后退键的时候就不会再出现Splash页面
    Application.router.navigateTo(context, Routes.login, replace: true);
  }

  static void goHome(BuildContext context) {
    /// replace：true 就是将 splash 页面给移除掉了，这点后退键的时候就不会再出现Splash页面
    Application.router.navigateTo(context, Routes.home, replace: true);
  }

  ///我的饲养员界面
  static void goMyBreeder(BuildContext context) {
    Application.router.navigateTo(context, Routes.myBreeder, replace: false);
  }

  //签到
  static void goSign(BuildContext context) {
    Application.router.navigateTo(context, Routes.sign, replace: false);
  }

  static void goTaskWall(BuildContext context, String url) {
    Application.router
        .navigateNext(context, url, replace: false, opaque: false);
  }

  static void goPath(BuildContext context, String path) {
    Application.router.navigateTo(context, path, replace: false);
  }
  static void goInvite(BuildContext context) {
    Application.router.navigateTo(context, Routes.invite, replace: false);
  }
}
