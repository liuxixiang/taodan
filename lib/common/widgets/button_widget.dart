import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taodan/common/values/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taodan/common/values/styles.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget(
      {@required this.text,
      @required this.onPressed,
      this.color = AppColors.yellow,
      this.borderSideColor = AppColors.yellow_pale,
      this.borderSideWidth = 3,
      this.borderSideRadius = 23,
      this.textColor = Colors.white,
      this.width = double.infinity,
      this.height = 40, this.textStyle});

  final Color color;
  final Color textColor;
  final Color borderSideColor;
  final double borderSideWidth;
  final double borderSideRadius;
  final VoidCallback onPressed;
  final String text;
  final double height;
  final double width;
  final double textStyle;

  // final
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      width: width.w,
      child: RaisedButton(
        onPressed: onPressed,
        child: Text(text, style: textStyle ?? AppStyles.textSize15_white),
        color: color,
        textColor: textColor,
        shape: RoundedRectangleBorder(
            side: BorderSide(
              color: borderSideColor,
              width: borderSideWidth.w,
            ),
            borderRadius: BorderRadius.circular(borderSideRadius.w)),
      ),
    );
  }
}
