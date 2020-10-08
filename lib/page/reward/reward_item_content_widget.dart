import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taodan/common/values/colors.dart';

class RewardItemContentWidget extends StatelessWidget {
  final Widget child;

  const RewardItemContentWidget({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: child,
        margin: EdgeInsets.only(top: 10.w),
        padding:
            EdgeInsets.only(top: 10.w, left: 10.w, right: 10.w, bottom: 10.w),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: AppColors.gray_f0));
  }
}
