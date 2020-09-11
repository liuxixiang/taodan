import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:taodan/common/values/colors.dart';
import 'package:taodan/common/widgets/app_bar.dart';
import 'package:taodan/page/user_info/user_info_viewmodel.dart';

class UserInfoPage extends StatefulWidget {
  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            appBar(context, title: "个人信息", backgroundColor: AppColors.yellow),
        body: ViewModelBuilder<UserInfoViewModel>.reactive(
            viewModelBuilder: () => UserInfoViewModel(),
            onModelReady: (model) async {},
            builder: (context, model, child) => Container(
                    child: Column(
                  children: [],
                ))));
  }
}
