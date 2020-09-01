import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taodan/page/sign/sign_dialog.dart';

class SignPage extends StatefulWidget {
  @override
  _SignPageState createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _showSignDialog();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  _showSignDialog() {
    //Future类型,then或者await获取
    Future.delayed(Duration.zero, () {
      showDialog(
          barrierDismissible: false, //   点击提示框外围不消失
          context: context,
          builder: (context) {
            return SignDialog();
          });
    });


  }
}
