import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:taodan/page/home/home_page.dart';
import 'package:taodan/page/login/login_page.dart';
import 'package:taodan/page/splash/splash_page.dart';

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
