import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/screenutil.dart';

class YYScreenUtil {
  static init({
    Size designSize,
    bool allowFontScaling = false,
  }) {
    ScreenUtil.init(designSize: designSize, allowFontScaling: allowFontScaling);
  }

  static num setSp(num fontSize, {bool allowFontScalingSelf}) {
    return ScreenUtil()
        .setSp(fontSize, allowFontScalingSelf: allowFontScalingSelf);
  }

  static num setWidth(num width) {
    return ScreenUtil().setWidth(width);
  }

  static num setHeight(num height) {
    return ScreenUtil().setHeight(height);
  }
}
