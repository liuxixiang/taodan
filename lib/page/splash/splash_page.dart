import 'package:flutter/material.dart';
import 'package:taodan/router/navigator_util.dart';
import 'package:taodan/utils/yy_screen_util.dart';

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
    //设置适配尺寸 (填入设计稿中设备的屏幕尺寸) 此处假如设计稿是按iPhone6的尺寸设计的(iPhone6 750*1334)
    YYScreenUtil.init(context,
        designSize: Size(375, 667), allowFontScaling: false);

    return Scaffold(
      body: Text(""),
    );
  }
}
