import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taodan/common/values/colors.dart';
import 'package:taodan/common/values/styles.dart';

class LeverProgressWidget extends StatelessWidget {
  final int progress;
  final double width;
  final double height;
  final double radius;
  final int minProgress;
  final int maxProgress;

  LeverProgressWidget(
      {Key key,
      this.progress = 0,
      this.width = 250,
      this.height = 12,
      this.radius = 6,
      this.minProgress = 0,
      this.maxProgress = 100})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: width,
          height: height,
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(radius)),
              child: Stack(
                children: <Widget>[
                  Container(
                    width: width,
                    height: height,
                    decoration: BoxDecoration(color: AppColors.yellow_gray),
                  ),
                  Positioned(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(radius)),
                      child: Container(
                        alignment: Alignment.center,
                        width: progress <= 0
                            ? 0
                            : progress <= 5
                                ? 5 / 100 * width
                                : progress < 100
                                    ? progress / 100 * width
                                    : width,
                        height: height,
                        decoration: BoxDecoration(color: AppColors.yellow_500),
                        child: Text(
                          "$progress",
                          style: AppStyles.textSize11_yellow_a00,
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ),
        SizedBox(
          height: 2,
        ),
        Row(
          children: [
            Text(
              '$minProgress',
              style: AppStyles.textSize11_white,
            ),
            Spacer(),
            Text(
              '$maxProgress',
              style: AppStyles.textSize11_white,
            ),
          ],
        )
      ],
    );
  }
}
