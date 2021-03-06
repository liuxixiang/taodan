import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:taodan/router/router_handler.dart';

class Routes {
  static const String root = '/'; // 根目录
  static const String login = '/login'; // 登录
  static const String home = '/home'; // 首页
  static const String myBreeder = '/myBreeder'; // 我的饲养员
  static const String sign = '/sign'; // 我的饲养员
  static const String taskWall = "app/task";
  static const String invite = "/invite"; //邀请码界面
  static const String test = "/test";

  // static const String taskWall = "/task";
  // static const String invite = "/invite";//邀请码界面
  static const String userInfo = "/userInfo"; //个人信息
  static const String webview = "/webview"; //个人信息
  static const String updateInfoPage = "/updateInfoPage"; //修改个人信息
  static const String throwingEgg = "/throwingEgg"; //砸蛋

  // 配置route
  static void configureRoutes(FluroRouter router) {
    // 未发现对应route
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      print('route not found!');
      return;
    });

    router.define(root, handler: RouterHandler().splashHandler); // 根目录
    router.define(login, handler: RouterHandler().loginHandler); //  登录
    router.define(home, handler: RouterHandler().homeHandler); //  首页
    router.define(myBreeder, handler: RouterHandler().myBreederHandler); //我的饲养员
    router.define(sign, handler: RouterHandler().signHandler); //我的饲养员
    router.define(taskWall, handler: RouterHandler().taskWallHandler);
    router.define(invite, handler: RouterHandler().inviteHandler);
    router.define(test, handler: RouterHandler().testHandler);
    router.define(userInfo, handler: RouterHandler().userInfoHandler);
    router.define(webview, handler: RouterHandler().webHandler);
    router.define(updateInfoPage, handler: RouterHandler().updateInfoHandler);
    router.define(throwingEgg, handler: RouterHandler().throwingEggsHandler);
  }
}
