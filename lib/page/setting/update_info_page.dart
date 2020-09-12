import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taodan/common/values/colors.dart';
import 'package:taodan/common/widgets/app_bar.dart';
import 'package:taodan/common/widgets/clear_textfield.dart';

class UpdateInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, title: "修改昵称", backgroundColor: AppColors.yellow),
      body: Container(
          // color: Colors.yellow,
          child: ClearTextField(
        hintText: '昵称',
        onChanged: (String value) {},
      )),
    );
  }
}
