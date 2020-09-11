import 'package:flutter/cupertino.dart';
import 'package:taodan/common/values/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WalletItemWidget extends StatelessWidget {
  final String text;
  final String title;
  final String image;
  final GestureTapCallback onTag;

  const WalletItemWidget(
      {Key key, this.text, this.title, this.image, this.onTag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTag,
      child: Column(
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
      ),
    );
  }
}
