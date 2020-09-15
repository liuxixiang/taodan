import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taodan/common/apis/api_user.dart';
import 'package:taodan/common/manager/user_manager.dart';
import 'package:taodan/model/login_entity.dart';
import 'package:taodan/model/user_info_entity.dart';

import 'package:taodan/router/navigator_util.dart';
import 'package:taodan/state/user_state.dart';
import 'package:taodan/utils/EventBus.dart';
import 'package:taodan/utils/assets_util.dart';
import 'package:taodan/utils/yy_screen_util.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //监听登录事件
    bus.on("login", (arg) {
      NavigatorUtil.goBack(context);
    });

    _save(LoginEntity loginEntity) {
      if (loginEntity == null) {
        return;
      }
      // 保存用户信息
      context
          .read<UserState>()
          .saveUserInfo(loginEntity.userInfoRspDto ?? UserInfoEntity());
      // UserManager.getInstance()
      //     .saveUserInfo(loginEntity.userInfoRspDto ?? UserInfoEntity());
      UserManager.getInstance().saveSecretKey(loginEntity.secretKey);
      String auth = loginEntity.token;
      if (auth.isNotEmpty) {
        // 重置auth
        UserManager.getInstance().saveAuth(loginEntity.token);
      }
      //绑定了上级 保存用户登陆状态
      if (loginEntity.bindInviteFlag) {
        UserManager.getInstance().saveLogin(true);
      }
    }

    _clickLogin() {
      UserAPI.login('devops888', '18521701324', (data) {
        _save(data);
        if (data.bindInviteFlag) {
          NavigatorUtil.goBack(context);
        } else {
          NavigatorUtil.goInvite(context);
        }
      });
    }

    Widget titleArea = new Padding(
      padding: EdgeInsets.fromLTRB(
          YYScreenUtil.setWidth(15.5), YYScreenUtil.setHeight(36.5), 0, 0),
      child: new Text(
        "Hello,\n欢迎登录赚金蛋",
        style: new TextStyle(
            fontSize: YYScreenUtil.setSp(19), fontWeight: FontWeight.w700),
      ),
    );

    Widget logoArea = new Padding(
      padding: EdgeInsets.only(top: YYScreenUtil.setHeight(70.5)),
      child: new Center(
        child: new Image.asset(
          AssetsUtil.login.logo,
          width: YYScreenUtil.setWidth(90),
        ),
      ),
    );

    Widget buttonArea = new Padding(
      padding: EdgeInsets.only(top: YYScreenUtil.setHeight(59)),
      child: new Center(
        child: new SizedBox(
          width: YYScreenUtil.setWidth(300),
          height: YYScreenUtil.setHeight(45),
          child: new RaisedButton(
            color: Color(0xffffffff),
            textColor: Color(0xff333333),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(22.5))),
            child: new Text("一键登录"),
            onPressed: () {
              _clickLogin();
            },
          ),
        ),
      ),
    );
    Widget richTextArea = new Padding(
      padding: EdgeInsets.only(top: YYScreenUtil.setHeight(32.5)),
      child: new Center(
        child: new RichText(
          text: TextSpan(
              text: "登录即表示同意淘金蛋",
              style: TextStyle(
                  fontSize: YYScreenUtil.setSp(12), color: Color(0xff666666)),
              children: [
                TextSpan(
                  text: "《用户协议》",
                  style: TextStyle(
                    fontSize: YYScreenUtil.setSp(12),
                    color: Color(0xffF28A21),
                  ),
                  recognizer: new TapGestureRecognizer()
                    ..onTap = () {
                      print('《用户协议》');
                    },
                ),
                TextSpan(
                    text: "《隐私协议》",
                    style: TextStyle(
                      fontSize: YYScreenUtil.setSp(12),
                      color: Color(0xffF28A21),
                    ),
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () {
                        print('《用户协议》');
                      }),
              ]),
        ),
      ),
    );
    Widget bottomArea = new Expanded(
        child: new Container(
      child: new Image.asset(
        AssetsUtil.login.bottom,
        width: YYScreenUtil.setWidth(375),
      ),
      alignment: AlignmentDirectional.bottomEnd,
    ));
    Widget body = new Container(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [titleArea, logoArea, buttonArea, richTextArea, bottomArea],
      ),
    );
    return Scaffold(body: body);
  }
}
