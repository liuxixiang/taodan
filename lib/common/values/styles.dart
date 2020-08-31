import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taodan/common/values/colors.dart';
import 'package:taodan/common/values/dimens.dart';

class AppStyles {
  static TextStyle textSize16_99 =
      TextStyle(fontSize: AppDimens.font_sp16, color: AppColors.gray_99);
  static TextStyle textSize16_white =
      TextStyle(fontSize: AppDimens.font_sp16, color: Colors.white);
  static TextStyle textSize15_white =
      TextStyle(fontSize: AppDimens.font_sp15, color: Colors.white);
  static TextStyle textSize12_white =
      TextStyle(fontSize: AppDimens.font_sp12, color: Colors.white);
  static TextStyle textSize13_yellow =
      TextStyle(fontSize: AppDimens.font_sp13, color: AppColors.yellow);
  static TextStyle textSize21_yellow_light =
  TextStyle(fontSize: AppDimens.font_sp21, color: AppColors.yellow_light);
}
