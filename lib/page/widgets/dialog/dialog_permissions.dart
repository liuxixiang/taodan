import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taodan/common/values/colors.dart';
import 'package:taodan/common/values/dimens.dart';
import 'package:taodan/common/values/styles.dart';
import 'package:taodan/common/widgets/ad_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PermissionsDialog extends AdDialog {
  @override
  Widget buildDialogContent() {
    return Container(
      padding:
          EdgeInsets.only(top: 24.h, left: 25.w, right: 25.w, bottom: 18.h),
      decoration: BoxDecoration(
//        border: Border.all(color: Colors.white, width: 0.5), // 边色与边宽度
        color: Colors.white, // 底色
        //        borderRadius: new BorderRadius.circular((20.0)), // 圆角度
        borderRadius: BorderRadius.circular(5.w), // 也可控件一边圆角大小
      ),
      child: Column(
        children: [
          Text(
            '隐私政策提示',
            style: AppStyles.textSize18_black_33,
          ),
          SizedBox(
            height: 10.5.h,
          ),
          RichText(
            text: TextSpan(
//                style: DefaultTextStyle.of(context).style,
                children: <InlineSpan>[
                  TextSpan(
                      text: '感谢您信任并使用淘金蛋，为了更好的保护您的隐私和个人信息安全，根据国家相关法律规定和标准制定淘蛋蛋',
                      style: AppStyles.textSize14_gray_66),
                  TextSpan(
                    text: '《xxx服务协议》',
                    style: AppStyles.textSize14_yellow_cream,
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                  TextSpan(text: '与', style: AppStyles.textSize14_gray_66),
                  TextSpan(
                    text: '《xxx服务协议》',
                    style: AppStyles.textSize14_yellow_cream,
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                  TextSpan(
                      text: '请您在使用前仔细阅读并了解。',
                      style: AppStyles.textSize14_gray_66),
                ]),
          ),
          SizedBox(height: 15.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlineButton(
                shape: RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppDimens.dpRadius))),
                child: Text('不同意', style: AppStyles.textSize16_black_33),
                borderSide: BorderSide(color: AppColors.gray_97, width: 1.w),
                onPressed: () {},
              ),
              SizedBox(
                width: 32.5.w,
              ),
              RaisedButton(
                ///圆角
                shape: RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppDimens.dpRadius))),
                color: AppColors.yellow,
                child: Text('同意', style: AppStyles.textSize16_white),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}
