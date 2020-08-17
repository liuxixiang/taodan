import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:taodan/page/home/hone_page.dart';
import 'package:taodan/page/login/LoginPage.dart';
import 'package:taodan/page/splash/SplashPage.dart';

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
    return HomePage();
  });
}
