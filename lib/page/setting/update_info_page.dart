import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:taodan/common/values/colors.dart';
import 'package:taodan/common/values/styles.dart';
import 'package:taodan/common/widgets/app_bar.dart';
import 'package:taodan/common/widgets/clear_textfield.dart';
import 'package:taodan/page/setting/update_info_viewmodel.dart';
import 'package:taodan/utils/object_utils.dart';
import 'package:taodan/utils/toast_utils.dart';

class UpdateInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UpdateInfoViewModel>.reactive(
      viewModelBuilder: () => UpdateInfoViewModel(),
      builder: (context, model, child) => Scaffold(
          appBar: appBar(context,
              title: "修改昵称",
              backgroundColor: AppColors.yellow,
              rightWidget: GestureDetector(
                onTap: () => _clickSave(model),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(right: 15.w),
                    child: Text('保存',
                        textAlign: TextAlign.center,
                        style: AppStyles.textSize15_white),
                  ),
                ),
              )),
          body: Container(
            child: ClearTextField(
              border: InputBorder.none,
              hintText: '昵称',
              onChanged: model.updateString,
            ),
          )),
    );
  }

  _clickSave(UpdateInfoViewModel model) {
    if (ObjectUtils.isNotEmpty(model.info)) {
      model.updateInfo();
    }else{
      ToastUtils.showCenterToast('请输入昵称');
    }
  }
}
