import 'dart:math';

import 'package:flutter/material.dart';
import 'package:taodan/utils/yy_screen_util.dart';

class ProgressWidget extends StatelessWidget {
  int progress;
  int max;
  double width;
  double height;
  double radius;
  double borderWidth;
  Color borderColor;
  Color bgColor;
  Color progressColor;

  ProgressWidget(this.progress,
      {Key key,
      int max = 100,
      this.radius,
      this.width,
      this.height,
      this.progressColor,
      Color bgColor = Colors.white,
      this.borderColor}) {
    this.max = max;
    this.progressColor = progressColor;
    this.bgColor = bgColor;
    this.radius =
        radius == null ? YYScreenUtil.setHeight(10).toDouble() : radius;
    this.width = width == null ? YYScreenUtil.setHeight(57).toDouble() : width;
    this.height =
        height == null ? YYScreenUtil.setHeight(18).toDouble() : height;
    this.progressColor =
        progressColor == null ? Color(0xFFFB8E92) : progressColor;
    this.borderColor = borderColor == null ? Color(0xffB12A2E) : borderColor;
    this.borderWidth = YYScreenUtil.setWidth(2);
    if (progress > 100) {
      progress = 100;
    }
  }
  double get innerWidth => progress / max * (width - borderWidth * 2);

  num get progressValue {
    if (100.toDouble() * progress / max > 100) {
      return 100;
    } else {
      return 100.toDouble() * progress / max;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: bgColor,
                  border: Border.all(
                    color: borderColor,
                    width: borderWidth,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(radius)),
                ),
              ),
              Positioned(
                left: borderWidth,
                top: borderWidth,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(radius)),
                  child: Container(
                    width: innerWidth,
                    height: height - borderWidth * 2,
                    decoration: BoxDecoration(color: progressColor),
                    child: Center(
                      child: Text(progress.toString() + "%",
                          style: TextStyle(
                              fontSize: YYScreenUtil.setSp(9),
                              color: Colors.white)),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
