import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:taodan/common/values/colors.dart';
import 'package:taodan/common/values/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FunctionItemWidget extends StatelessWidget {
  final String title;
  final String num;
  final String image;

  const FunctionItemWidget({Key key, this.title, this.num, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Badge(
          position: BadgePosition.topRight(top: -5.w, right: -5.w),
          badgeColor: AppColors.red,
          padding: EdgeInsets.all(3),
          showBadge: (num ?? "").isNotEmpty,
          badgeContent: Text(num??"", style: AppStyles.textSize10_white),
          child: Image.asset(image),
        ),
        SizedBox(height: 7.5.h),
        Text(
          title,
          style: AppStyles.textSize16_black_33,
        )
      ],
    );
  }
}
