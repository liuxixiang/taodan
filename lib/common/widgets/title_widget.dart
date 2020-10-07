import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taodan/common/values/colors.dart';
import 'package:taodan/common/values/styles.dart';

class TitleWidget extends StatelessWidget {
  final String title;

  const TitleWidget({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 3.w,
          height: 11.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.25.w),
            color: AppColors.yellow, // 底色
          ),
        ),
        SizedBox(width: 5.5.w),
        Text(title, style: AppStyles.textSize15_black_33_bold)
      ],
    );
  }
}
