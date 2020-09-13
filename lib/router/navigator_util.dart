import 'package:flutter/material.dart';
import 'package:taodan/common/manager/user_manager.dart';
import 'package:taodan/router/application.dart';
import 'package:taodan/router/application.dart';
import 'package:taodan/router/routes.dart';

class NavigatorUtil {
  static void goLogin(BuildContext context, bool replace) {
    /// replace：true 就是将 splash 页面给移除掉了，这点后退键的时候就不会再出现Splash页面
    // Application.router.navigateTo(context, Routes.login, replace: replace);
    goNext(context, Routes.login, needCheckLogin: false);
  }

  static void goHome(BuildContext context) {
    /// replace：true 就是将 splash 页面给移除掉了，这点后退键的时候就不会再出现Splash页面
    goNext(context, Routes.home, needCheckLogin: false);
  }

  ///我的饲养员界面
  static void goMyBreeder(BuildContext context) {
    goNext(context, Routes.myBreeder);
  }

  //签到
  static void goSign(BuildContext context) {
    goNext(context, Routes.sign);
  }

  static void goTaskWall(BuildContext context, String url) {
    goNext(context, url, replace: false, opaque: false);
  }

  static void goPath(BuildContext context, String path) {
    goNext(context, path);
  }

  static void goInvite(BuildContext context) {
    goNext(context, Routes.invite);
  }

  static void goTest(BuildContext context) {
    goNext(context, Routes.test);
  }

  ///个人信息
  static void goUserInfo(BuildContext context) {
    goNext(context, Routes.userInfo);
  }

  ///修改个人信息
  static void goUpdateInfoPage(BuildContext context) {
    Application.router.navigateTo(context, Routes.updateInfoPage, replace: false);
  }

  // 返回
  static void goBack(BuildContext context) {
    Application.router.pop(context);
  }

  static void goWebView(BuildContext context, String url) {
    var value = Uri.encodeComponent(url);
    goNext(context, Routes.webview + "?url=" + value);
  }

  static Future<void> goNext(BuildContext context, url,
      {bool replace = false,
      bool opaque = true,
      bool needCheckLogin = true}) async {
    if (needCheckLogin & await UserManager.getInstance().isLogin) {
      url = Routes.login;
    }

    Application.router.navigateNext(
      context,
      url,
      replace: replace,
      opaque: opaque,
    );
  }
}
