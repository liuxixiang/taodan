import 'package:flutter/cupertino.dart';
import 'package:taodan/common/values/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WalletItemWidget extends StatelessWidget {
  final String text;
  final String title;
  final String image;

  const WalletItemWidget({Key key, this.text, this.title, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image),
            SizedBox(width: 2.5.w),
            Text(
              title,
              style: AppStyles.textSize13_gray_99,
            )
          ],
        ),
        SizedBox(height: 7.5.h),
        Text(
          text,
          style: AppStyles.textSize16_black_33,
        )
      ],
    );
  }
}
