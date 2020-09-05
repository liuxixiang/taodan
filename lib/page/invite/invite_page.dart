import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:taodan/common/values/colors.dart';
import 'package:taodan/common/values/styles.dart';
import 'package:taodan/common/widgets/app_bar.dart';
import 'package:taodan/page/invite/invite_viewmodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InvitePage extends StatefulWidget {
  @override
  _InvitePageState createState() => _InvitePageState();
}

class _InvitePageState extends State<InvitePage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InviteViewModel>.reactive(
      viewModelBuilder: () => InviteViewModel(),
      onModelReady: (model) => {
//         model.request()
      },
      builder: (context, model, child) => Scaffold(
          appBar: appBar(context,title: "hahah"),
          body: Container(
            color: Colors.yellow,
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
                    borderSide: BorderSide(color: AppColors.yellow, width: 3.w),
                    borderRadius: BorderRadius.all(Radius.circular(23))),
                hintText: '邀请码',
                hintStyle: AppStyles.textSize15_yellow_black,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.yellow, width: 3.w),
                    borderRadius: BorderRadius.all(Radius.circular(23))),
              ),
            ),
          )),
    );
  }
}
