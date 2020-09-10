import 'package:flutter/material.dart';
import 'package:taodan/common/manager/user_manager.dart';
import 'package:taodan/common/widgets/progress_widget.dart';
import 'package:taodan/router/navigator_util.dart';
import 'package:taodan/utils/log_util.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPagState createState() => _SplashPagState();
}

class _SplashPagState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () async {
     NavigatorUtil.goHome(context);
      // if (await UserManager.getInstance().checkLogin()) {
      //   NavigatorUtil.goHome(context);
      // }
    });
    // /// 2秒后跳转到主页面，上面注释的代码也可以做到倒计时
    // Observable.timer(0, Duration(seconds: 5)).listen((_) {
    //   /// 然后看 NavigatorUtil.dart
    //   NavigatorUtil.goLogin(context);
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: ProgressWidget(80),
        ),
      ),
    );
  }
}
