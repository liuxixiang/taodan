import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taodan/common/values/styles.dart';
import 'package:taodan/utils/assets_util.dart';

AppBar appBar(context,
    {String title,
    bool centerTitle = true,
    Color backgroundColor,
    Widget rightWidget,
    bool isLeading = true,
    TextStyle style,
    VoidCallback onPressed}) {
  return AppBar(
    backgroundColor: backgroundColor,
    leading: isLeading
        ? IconButton(
            icon: Image.asset(AssetsUtil.common.back_arrow),
            onPressed: () {
              if (onPressed == null) {
                Navigator.pop(context);
              }
            },
          )
        : Container(),
    centerTitle: centerTitle,
    title: Text(
      title,
      style: style ?? AppStyles.textSize18_white,
    ),
    actions: <Widget>[rightWidget ?? Center()],
  );
}
