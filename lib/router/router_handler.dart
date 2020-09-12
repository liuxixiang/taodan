import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:taodan/page/breeder/my_breeder_page.dart';
import 'package:taodan/page/invite/invite_page.dart';
import 'package:taodan/page/main/main_page.dart';
import 'package:taodan/page/login/login_page.dart';
import 'package:taodan/page/sign/sign_page.dart';
import 'package:taodan/page/splash/splash_page.dart';
import 'package:taodan/page/task/task_wall.dart';
import 'package:taodan/page/test/test.dart';
import 'package:taodan/page/user_info/user_info_page.dart';
import 'package:taodan/page/webview/webview_page.dart';
import 'package:taodan/utils/log_util.dart';

class RouterHandler {
  var splashHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new SplashPage();
  });

  var loginHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new LoginPage();
  });

  var homeHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return MainPage();
  });

  var myBreederHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return MyBreederPage();
  });
  var signHandler =
      new Handler(handlerFunc: (BuildContext context, dynamic params) {
    LogUtil.e("params===$params", tag: "lxh");
    return SignPage();
  });

  var taskWallHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    // params["id"],
    return TaskWallPage();
  });
  var inviteHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    // params["id"],
    return InvitePage();
  });

  var testHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    // params["id"],
    return TestPage();
  });
  var userInfoHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    // params["id"],
    return UserInfoPage();
  });

  var webHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return WebviewWidget(params["url"][0]);
  });
}
