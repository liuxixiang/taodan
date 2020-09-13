import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:taodan/common/manager/user_manager.dart';
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
      onModelReady: (model) async {
        model.updateString((await UserManager.getInstance().userInfo).name);
      },
      builder: (context, model, child) => Scaffold(
          appBar: appBar(context,
              title: "修改昵称",
              backgroundColor: AppColors.yellow,
              rightWidget: GestureDetector(
                onTap: () => _clickSave(context, model),
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
              controller: TextEditingController.fromValue(TextEditingValue(
                  // 设置内容
                  text: model.info ?? "",
                  // 保持光标在最后
                  selection: TextSelection.fromPosition(TextPosition(
                      affinity: TextAffinity.downstream,
                      offset: (model.info??"").length))
              )),
              border: InputBorder.none,
              hintText: '昵称',
              onChanged: model.updateString,
            ),
          )),
    );
  }

  _clickSave(BuildContext context, UpdateInfoViewModel model) {
    if (ObjectUtils.isNotEmpty(model.info)) {
      model.updateInfo(context);
    } else {
      ToastUtils.showCenterToast('请输入昵称');
    }
  }
}
