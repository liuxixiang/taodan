import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taodan/utils/assets_util.dart';

AppBar appBar(context,
    {String title,
    bool centerTitle = true,
    Color backgroundColor,
    Widget rightWidget,
    VoidCallback onPressed}) {
  return AppBar(
    backgroundColor: backgroundColor,
    leading: IconButton(
      icon: Image.asset(AssetsUtil.common.back_arrow),
      onPressed: () {
        if (onPressed == null) {
          Navigator.pop(context);
        }
      },
    ),
    centerTitle: centerTitle,
    title: Text(title),
    actions: <Widget>[rightWidget ?? Center()],
  );
}
