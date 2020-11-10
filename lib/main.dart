import 'package:dio/dio.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taodan/common/apis/api_path.dart';
import 'package:taodan/common/config/remote_config.dart';
import 'package:taodan/common/manager/config_manager.dart';
import 'package:taodan/common/values/colors.dart';
import 'package:taodan/router/Routes.dart';
import 'package:taodan/state/user_state.dart';
import 'package:taodan/utils/log_util.dart';

import 'api/http_utils.dart';
import 'api/interceptors/header_interceptor.dart';
import 'api/interceptors/sign_interceptor.dart';
import 'api/interceptors/token_interceptor.dart';
import 'common/Global.dart';
import 'common/config/config.dart';
import 'common/manager/context_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Global.init().then((e) => runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider<UserState>(create: (_) => UserState()),
        ],
        child: MyApp(),
      )));
}

class MyApp extends StatelessWidget {
  MyApp() {
    LogUtil.init();
    initDio();
    Global.router = FluroRouter();
    Routes.configureRoutes(Global.router);

//    ConfigManager.getInstance().batchInsertUpdateConfig("assets/json/mine_config.json");
    ConfigManager.getInstance().loadConfigs(
        [RemoteConfigCode.config_100100, RemoteConfigCode.config_100101]);
  }

  void initDio() {
    setInitDio(
      baseUrl: ApiPath.baseUrl,
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

    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: Global.router.generator,
      navigatorKey: ContextManager.navigatorKey,
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
          scaffoldBackgroundColor: AppColors.bg_page),
    );
  }
}
