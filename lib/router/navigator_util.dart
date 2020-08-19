import 'package:flutter/material.dart';
import 'package:taodan/router/application.dart';
import 'package:taodan/router/routes.dart';

class NavigatorUtil {
  static void goLogin(BuildContext context) {
    /// replace：true 就是将 splash 页面给移除掉了，这点后退键的时候就不会再出现Splash页面
    Application.router.navigateTo(context, Routes.login, replace: true);
  }

  static void goHome(BuildContext context) {
    /// replace：true 就是将 splash 页面给移除掉了，这点后退键的时候就不会再出现Splash页面
    Application.router.navigateTo(context, Routes.home, replace: true);
  }
}
