import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:taodan/common/values/colors.dart';
import 'package:taodan/common/values/styles.dart';
import 'package:taodan/common/widgets/ad_dialog.dart';
import 'package:taodan/common/widgets/button_widget.dart';
import 'package:taodan/utils/assets_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChickenNameDialog extends AdDialog {
  @override
  Widget buildDialogContent() {
    return Stack(
      children: [
        Container(
            child: Image.asset(AssetsUtil.dialog.bg_dialog_chicken_name,
                fit: BoxFit.cover)),
        Positioned(
          left: 36.w,
          right: 36.w,
          top: 115.5.h,
          child: Text(
              '蹦蹦（邀请人）送了您一只小鸡，快给你的小鸡取个名字吧，抚养小鸡99级，可称为赚金蛋超级权益人，终身享有平均每日199元的现金分红',
              softWrap: true),
        ),
        Positioned(
            bottom: 121.5.h,
            left: 30.w,
            right: 30.w,
            child: Container(
              child: TextField(
                // maxLength: 8,
                //不使用maxLength 右下角会出现1/8
                inputFormatters: [LengthLimitingTextInputFormatter(8)],
                decoration: InputDecoration(
                  border: InputBorder.none,
                  //去掉输入框的下滑线
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.yellow, width: 3.w),
                      borderRadius: BorderRadius.all(Radius.circular(23))),
                  hintText: '名字',
                  hintStyle: AppStyles.textSize15_yellow_black,
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.yellow, width: 3.w),
                      borderRadius: BorderRadius.all(Radius.circular(23))),
                ),
              ),
            )),
        Positioned(
            bottom: 51.h,
            left: 30.w,
            right: 30.w,
            child: ButtonWidget(
              text: '确定',
              height: 40,
              onPressed: () {},
            ))
      ],
    );
  }
}
