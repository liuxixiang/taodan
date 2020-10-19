import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:stacked/stacked.dart';
import 'package:taodan/common/values/colors.dart';
import 'package:taodan/common/values/styles.dart';
import 'package:taodan/common/widgets/app_bar.dart';
import 'package:taodan/page/throwing_eggs/throwing_eggs_viewmodel.dart';
import 'package:taodan/utils/assets_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThrowingEggsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            appBar(context, title: "砸鸡蛋", backgroundColor: AppColors.deep_red),
        body: ViewModelBuilder<ThrowingEggsViewModel>.reactive(
            viewModelBuilder: () => ThrowingEggsViewModel(),
            builder: (context, model, child) => Container(
                  child: Column(
                    children: [
                      _buildNoticeView(),
                      _buildContentView(),
                    ],
                  ),
                )));
  }

  _buildNoticeView() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.5.w),
      height: 35.h,
      color: AppColors.red_711,
      child: Row(
        children: [
          Image.asset(AssetsUtil.common.ic_notice),
          SizedBox(
            width: 14.5.w,
          ),
          Expanded(
            child: Marquee(
              text: 'Some sample text that takes some space.',
              style: AppStyles.textSize14_white,
              scrollAxis: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.start,
              blankSpace: 20.0,
              velocity: 50.0,
//              pauseAfterRound: Duration(seconds: 1),
//              startPadding: 100.0,
//              accelerationDuration: Duration(seconds: 1),
//              accelerationCurve: Curves.linear,
//              decelerationDuration: Duration(milliseconds: 500),
//              decelerationCurve: Curves.easeOut,
            ),
          )
        ],
      ),
    );
  }

  _buildContentView() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsUtil.throwing_egg.bg_throwing_egg),
        ),
      ),
      child: _buildEgg(),
    );
  }

  _buildEgg() {
    return Stack(
      children: [
        Container(
          child: Text('剩余10个鸡蛋'),
        ),
        Image.asset(AssetsUtil.throwing_egg.bg_egg),
        Image.asset(AssetsUtil.throwing_egg.ic_hammer)
      ],
    );
  }
}
