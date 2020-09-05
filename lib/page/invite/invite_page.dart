import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:taodan/common/values/colors.dart';
import 'package:taodan/common/values/styles.dart';
import 'package:taodan/common/widgets/app_bar.dart';
import 'package:taodan/common/widgets/button_widget.dart';
import 'package:taodan/common/widgets/clear_textfield.dart';
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
      builder: (context, model, child) => Scaffold(
          appBar: appBar(context,
              title: "填写邀请码", backgroundColor: AppColors.yellow),
          body: Column(
            children: [
              Container(
                  // color: Colors.yellow,
                  child: ClearTextField(
                hintText: '邀请码',
                onChanged: (String value) {
                  model.inviteCode = value;
                },
              )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 42.h, horizontal: 15.w),
                child: ButtonWidget(
                  height: 45.h,
                  onPressed: () {
                    model.invite();
                  },
                  text: '确定',
                ),
              )
            ],
          )),
    );
  }
}
