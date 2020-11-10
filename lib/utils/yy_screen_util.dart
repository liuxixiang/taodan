import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_screenutil/screenutil.dart';

class YYScreenUtil {
  static init(BuildContext context,{
    Size designSize,
    bool allowFontScaling = false,
  }) {
    ScreenUtil.init(context,designSize: designSize, allowFontScaling: allowFontScaling);
  }

  static num setSp(num fontSize, {bool allowFontScalingSelf}) {
    return fontSize.sp;
    // return ScreenUtil()
    //     .setSp(fontSize, allowFontScalingSelf: allowFontScalingSelf);
  }

  static num setWidth(num width) {
    return width.w;
    // return ScreenUtil().setWidth(width);
  }

  static num setHeight(num height) {
    return height.h;
    // return ScreenUtil().setHeight(height);
  }
}
