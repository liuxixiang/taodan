import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:taodan/common/apis/api_upload.dart';
import 'package:taodan/common/values/colors.dart';
import 'package:taodan/common/values/dimens.dart';
import 'package:taodan/common/widgets/app_bar.dart';
import 'package:taodan/common/widgets/item_widget.dart';
import 'package:taodan/page/user_info/user_info_viewmodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taodan/router/navigator_util.dart';
import 'package:taodan/utils/assets_util.dart';
import 'package:taodan/utils/crop_image_util.dart';
import 'package:taodan/utils/image_pick_util.dart';

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
            builder: (context, model, child) => Container(
                  child: _buildItemView(model),
                )));
  }

  _buildItemView(UserInfoViewModel model) {
    return Column(
      children: [
        ItemWidget(itemName: '用户等级'),
        ItemWidget(
          itemName: '星级等级',
          hasLine: false,
        ),
        SizedBox(height: 8.h),
        ItemWidget(
          itemName: '更换头像',
          rightWidget: Image.asset(AssetsUtil.mine.wallet),
          hasRightArrow: false,
          onTag: () {
            _openImageSheet(model);
          },
        ),
        ItemWidget(
          itemName: '修改昵称',
          hasLine: false,
          onTag: () {
            NavigatorUtil.goUpdateInfoPage(context);
          },
        ),
        SizedBox(height: 8.h),
        ItemWidget(
          itemName: '手机号码',
          hasRightArrow: false,
        ),
        ItemWidget(
          itemName: '微信账号',
          hasRightArrow: false,
        ),
      ],
    );
  }

  _openImageSheet(UserInfoViewModel model) {
    ImagePickUtil.openImageSheet(context, (file, imagePicker) async {
      if (file != null && await file.exists()) {
        String fileName = file.path.substring(file.path.lastIndexOf('/'));
        // file?.toString()?.substring(file.toString().lastIndexOf('/'));
        model.uploadHead(file.path, fileName);
      }
    });
  }
}
