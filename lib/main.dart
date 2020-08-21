import 'package:dio/dio.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:taodan/common/apis/api_path.dart';
import 'package:taodan/router/application.dart';
import 'package:taodan/router/routes.dart';
import 'package:taodan/utils/log_util.dart';
import 'package:taodan/utils/yy_screen_util.dart';

import 'api/http_utils.dart';
import 'api/interceptors/header_interceptor.dart';
import 'api/interceptors/sign_interceptor.dart';
import 'api/interceptors/token_interceptor.dart';
import 'common/config/config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp() {
    LogUtil.init();
    initDio();
    Router router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  void initDio() {
    setInitDio(
      baseUrl: ApiPath.BASE_URL,
      interceptors: [
        /// 统一添加身份验证请求头
        HeaderInterceptor(),
        SignInterceptor(),
        TokenInterceptors(),

        /// 打印Log(生产模式去除)
        !Config.inProduction ? LogInterceptor() : "",

        /// 适配数据(根据自己的数据结构，可自行选择添加)
        ///AdapterInterceptor()
      ],
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    YYScreenUtil.init(designSize: Size(375, 766), allowFontScaling: false);

    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: Application.router.generator,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
