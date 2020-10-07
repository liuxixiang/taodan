import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taodan/common/values/styles.dart';

class ItemContentWidget extends StatelessWidget {
  final String title;
  final TextStyle titleStyle;
  final String content;
  final TextStyle contentStyle;
  final String unit;
  final TextStyle unitStyle;
  final double width;
  final double height;
  final double top;
  final double bottom;
  final Color color;
  final GestureTapCallback onTap;

  const ItemContentWidget(
      {Key key,
      this.title,
      this.titleStyle,
      this.content,
      this.contentStyle,
      this.unit,
      this.unitStyle,
      this.width,
      this.height = 60,
      this.top = 10,
      this.bottom = 5,
      this.color = Colors.white,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width?.h,
        height: height.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(6.w)),
            color: color),
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            Positioned(
              top: top.h,
              child: Column(
                children: [
                  Text(
                    title,
                    style: titleStyle ?? AppStyles.textSize12_gray_66,
                  ),
                  Text(
                    unit ?? '',
                    style: unitStyle ?? AppStyles.textSize10_gray_66,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: bottom.h,
              child: Text(
                content,
                style: contentStyle ?? AppStyles.textSize18_yellow,
              ),
            )
          ],
        ),
      ),
    );
  }
}
