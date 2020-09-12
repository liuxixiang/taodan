import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taodan/common/values/colors.dart';
import 'package:taodan/common/values/styles.dart';
import 'package:taodan/utils/assets_util.dart';

class ItemWidget extends StatelessWidget {
  final String leftIcon;
  final String itemName;
  final TextStyle itemNameStyle;
  final String itemRightText;
  final TextStyle itemRightTextStyle;
  final Widget rightWidget;
  final double height;
  final bool hasLine;
  final bool hasRightArrow;
  final double lineWidth;
  final Color lineColor;
  final GestureTapCallback onTag;

  ItemWidget({
    Key key,
    @required this.itemName,
    this.leftIcon,
    this.itemNameStyle,
    this.itemRightText,
    this.itemRightTextStyle,
    this.height = 54,
    this.hasLine = true,
    this.lineWidth = 0.5,
    this.lineColor = AppColors.gray_bc,
    this.hasRightArrow = true,
    this.rightWidget,
    this.onTag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTag,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        decoration: BoxDecoration(
            color: Colors.white,
            border: hasLine
                ? Border(bottom: BorderSide(color: lineColor, width: lineWidth))
                : null),
        height: height.h,
        child: Row(
          children: [
            Container(
              child: (leftIcon ?? "").isNotEmpty
                  ? Row(
                      children: [
                        Image.asset(leftIcon),
                        SizedBox(width: 8.5.w),
                      ],
                    )
                  : null,
            ),
            Text(
              itemName,
              style: itemNameStyle ?? AppStyles.textSize15_black_33,
            ),
            Text(
              itemRightText ?? "",
              style: itemNameStyle ?? AppStyles.textSize15_99,
            ),
            Spacer(),
            if (rightWidget != null) rightWidget,
            if (hasRightArrow) Image.asset(AssetsUtil.common.arrow_right_white),
          ],
        ),
      ),
    );
  }
}
