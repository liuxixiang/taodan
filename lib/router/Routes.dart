import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:taodan/router/RouterHandler.dart';

class Routes {
  static Router router;
  static String root = '/'; // 根目录
  static String login = '/login'; // 登录
  static String home = '/home'; // 首页

  // 配置route
  static void configureRoutes(Router router) {
    // 未发现对应route
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      print('route not found!');
      return;
    });

    // router.define(root, handler: rootHandler); // 根目录
    router.define(root, handler: RouterHandler().splashHandler);
    router.define(login, handler: RouterHandler().loginHandler); //  登录
    router.define(home, handler: RouterHandler().homeHandler); //  登录
    // router.define(index, handler: settingHandler); // 首页
  }
}
