import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taodan/common/values/colors.dart';
import 'package:taodan/common/values/styles.dart';
import 'package:taodan/common/widgets/ad_dialog.dart';
import 'package:taodan/common/widgets/button_widget.dart';
import 'package:taodan/router/navigator_util.dart';
import 'package:taodan/utils/assets_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmployDialog extends AdDialog {
  final String employName;
  final int hirePrice;

  EmployDialog(this.employName, this.hirePrice);

  @override
  Widget buildDialogContent() {
    return Stack(
      children: [
        Container(
            child: Image.asset(
          AssetsUtil.dialog.breeder_employ,
        )),
        Positioned(
            left: 30.w,
            right: 30.w,
            top: 10.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
//              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Text(employName ?? '',
                        style: AppStyles.textSize18_black_33)),
                SizedBox(
                  height: 18.h,
                ),
                Text(
                  "雇佣所需金元宝",
                  style: AppStyles.textSize14_gray_66,
                ),
                SizedBox(
                  height: 5.h,
                ),
                _buildBorderText("$hirePrice"),
                SizedBox(
                  height: 10.5.h,
                ),
                Text(
                  "雇佣所需金元宝",
                  style: AppStyles.textSize14_gray_66,
                ),
                SizedBox(
                  height: 5.h,
                ),
                _buildBorderText("$hirePrice"),
              ],
            )),
        Positioned(
            bottom: 50.h,
            left: 20.w,
            right: 20.w,
            child: Row(
              children: [
                SizedBox(
                  width: 120.w,
                  height: 40.h,
                  child: RaisedButton(
                    elevation: 0,
                    onPressed: () {
                      NavigatorUtil.goBack(context);
                    },
                    child: Text(
                      '取消',
                      style: AppStyles.textSize16_white,
                    ),
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.white,
                          width: 1.w,
                        ),
                        borderRadius: BorderRadius.circular(23.w)),
                  ),
                ),
                Spacer(),
                ButtonWidget(
                  text: '确定雇佣',
                  width: 120,
                  height: 40,
                  onPressed: () {},
                )
              ],
            ))
      ],
    );
  }

  _buildBorderText(String value) {
    return Container(
      alignment: Alignment.centerLeft,
      width: double.infinity,
      height: 35.h,
      child: Text(
        value,
        style: AppStyles.textSize18_black_33,
      ),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
        border: Border.all(
          color: AppColors.gray_97,
          width: 1,
        ),
      ),
    );
  }
}
