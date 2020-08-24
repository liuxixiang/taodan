import 'package:flutter/material.dart';
import 'package:taodan/router/navigator_util.dart';

class MineSence extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MineSence> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          minWidth: double.infinity, //宽度尽可能大
          minHeight: 150.0 //最小高度为50像素
      ),
      child: RaisedButton(
        child: Text("normal"),
        onPressed: () {
          NavigatorUtil.goMyBreeder(context);
        },
      )
    );
  }
}
