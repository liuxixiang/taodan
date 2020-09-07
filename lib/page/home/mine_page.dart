import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:taodan/common/widgets/item_widget.dart';
import 'package:taodan/page/mine/mine_viewmodel.dart';
import 'package:taodan/page/sign/sign_dialog.dart';
import 'package:taodan/page/widgets/dialog/dialog_chicken_name.dart';
import 'package:taodan/page/widgets/dialog/dialog_permissions.dart';
import 'package:taodan/router/navigator_util.dart';
import 'package:taodan/utils/assets_util.dart';

class MineSence extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MineSence> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MineViewModel>.reactive(
        viewModelBuilder: () => MineViewModel(),

        // onModelReady:,
        builder: (context, model, child) => Container(
                child: Column(
              children: [_buildItemView()],
            )));
  }

  _buildItemView() {
    return Column(
      children: [
        // ItemWidget(itemName: '我的邀请码', leftIcon: AssetsUtil.common.back_arrow),
        // ItemWidget(itemName: '提现认证', leftIcon: AssetsUtil.common.back_arrow),
        // ItemWidget(itemName: '设置', leftIcon: AssetsUtil.common.back_arrow),
        // ItemWidget(itemName: '联系我们', leftIcon: AssetsUtil.common.back_arrow),
        // ItemWidget(itemName: '当前版本', leftIcon: AssetsUtil.common.back_arrow),
      ],
    );
  }
}
