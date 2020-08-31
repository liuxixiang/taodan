import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taodan/common/values/styles.dart';
import 'package:taodan/common/widgets/ad_dialog.dart';
import 'package:taodan/utils/assets_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignDialog extends AdDialog {
  @override
  buildDialogContent() {
    return Container(
      child: Column(
        children: [
          _buildDialogHead(),
          _buildSignDialogContent(),
        ],
      ),
    );
  }

  _buildDialogHead() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: Image.asset(AssetsUtil.sign.bg_sing),
        ),
        Positioned(
          top: 42.5.w,
          child: Text('+1', style: AppStyles.textSize21_yellow_light),
        ),
        Positioned(
          bottom: 10.5.h,
          child: Text('连续签到领饲料', style: AppStyles.textSize16_white),
        )
      ],
    );
  }

  _buildSignDialogContent() {
    return Container(
      child: GridView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        children: [
          _createGridViewItem(Colors.primaries[0]),
          _createGridViewItem(Colors.primaries[1]),
          _createGridViewItem(Colors.primaries[2]),
          _createGridViewItem(Colors.primaries[3]),
          _createGridViewItem(Colors.primaries[4]),
          _createGridViewItem(Colors.primaries[5]),
          _createGridViewItem(Colors.primaries[6]),
          _createGridViewItem(Colors.primaries[7]),
        ],
      ),
    );
  }

  _createGridViewItem(Color color) {
    return Container(
      height: 80,
      color: color,
    );
  }
}
