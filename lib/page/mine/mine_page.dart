import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:taodan/common/manager/user_manager.dart';
import 'package:taodan/common/values/colors.dart';
import 'package:taodan/common/values/styles.dart';
import 'package:taodan/common/widgets/item_widget.dart';
import 'package:taodan/common/widgets/user_head_widget.dart';
import 'package:taodan/page/mine/function_item_widget.dart';
import 'package:taodan/page/mine/mine_viewmodel.dart';
import 'package:taodan/page/mine/wallet_item_widget.dart';
import 'package:taodan/router/navigator_util.dart';
import 'package:taodan/state/user_state.dart';
import 'package:taodan/utils/assets_util.dart';

class MinePage extends StatelessWidget {
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return ViewModelBuilder<MineViewModel>.reactive(
        // 如果您只想触发初始化逻辑，则可以设置一次initialiseSpecialViewModelsOnce: true
        // initialiseSpecialViewModelsOnce: true,
        // disposeViewModel: false,
        viewModelBuilder: () => MineViewModel(),
        builder: (context, model, child) => SingleChildScrollView(
              child: Container(
                  child: Column(
                children: [_buildUserInfo(model), _buildItemView()],
              )),
            ));
  }

  _buildUserInfo(MineViewModel model) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Container(
            color: Colors.white,
            height: 184.5.h,
            child: Image.asset(AssetsUtil.mine.bg_head,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity),
          ),
          Container(
            padding: EdgeInsets.only(
                top: 45.h, left: 15.h, right: 21.w, bottom: 14.h),
            child: Column(
              children: [
                _buildUserInfoHead(model),
                SizedBox(height: 14.5.h),
                _buildUserWallet(model),
                SizedBox(height: 13.h),
                _buildUserFunction(model),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildUserInfoHead(MineViewModel model) {
    return GestureDetector(
      onTap: () => _onHeadClick(),
      child: Row(
        children: [
          UserHeadWidget(),
          SizedBox(width: 16.5),
          Expanded(
            child: Text(
                Provider.of<UserState>(context).isLogin
                    ? Provider.of<UserState>(context).userInfo?.name ?? "- -"
                    : "立即登陆",
                style: AppStyles.textSize16_white),
          ),
          Image.asset(AssetsUtil.common.arrow_right_white),
        ],
      ),
    );
  }

  _buildUserWallet(MineViewModel model) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.w),
          color: Colors.white, // 底色
          //        shape: BoxShape.circle, // 圆形，使用圆形时不可以使用borderRadius
          shape: BoxShape.rectangle, // 默认值也是矩形
          boxShadow: [
            BoxShadow(
                color: AppColors.gray_c1,
                offset: Offset(0.0, 1.0.w), //阴影xy轴偏移量
                blurRadius: 4.0.w, //阴影模糊程度
                spreadRadius: 0 //阴影扩散程度
                )
          ]),
      padding:
          EdgeInsets.only(left: 13.5.w, right: 13.5.w, top: 9.h, bottom: 15.h),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 3.w,
                height: 11.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.25.w),
                  color: AppColors.yellow, // 底色
                ),
              ),
              SizedBox(width: 5.5.w),
              Text("钱包", style: AppStyles.textSize13_black_33)
            ],
          ),
          SizedBox(
            height: 14.h,
          ),
          Row(
            children: [
              WalletItemWidget(
                  title: "今日金币",
                  text: !model.loadAccountInfoBusy
                      ? model.accountInfo?.todayCoinCount ?? "0"
                      : "- -",
                  image: AssetsUtil.mine.gold,
                  onTag: _onWalletGoldClick),
              Expanded(
                child: WalletItemWidget(
                    title: "金元宝余额",
                    text: !model.loadAccountInfoBusy
                        ? model.accountInfo?.goldIngotCount ?? "0.00000"
                        : "- -",
                    image: AssetsUtil.mine.wing,
                    onTag: _onWalletWingClick),
              ),
              WalletItemWidget(
                  title: "现金分红",
                  text: !model.loadAccountInfoBusy
                      ? model.accountInfo?.cashCount ?? "0.00"
                      : "- -",
                  image: AssetsUtil.mine.wallet,
                  onTag: _onWalletClick)
            ],
          )
        ],
      ),
    );
  }

  _buildUserFunction(MineViewModel model) {
    return Row(
      children: [
        Expanded(
          child: FunctionItemWidget(
            title: "我的订单",
            num: "10",
            image: AssetsUtil.mine.order,
            onTag: () => {},
          ),
        ),
        Expanded(
          child: FunctionItemWidget(
              title: "我的饲养员", image: AssetsUtil.mine.breeder),
        ),
        Expanded(
          child: FunctionItemWidget(
              title: "我的好友", num: "10", image: AssetsUtil.mine.friends),
        ),
        Expanded(
          child:
              FunctionItemWidget(title: "养鸡学院", image: AssetsUtil.mine.college),
        ),
      ],
    );
  }

  _buildItemView() {
    return Column(
      children: [
        ItemWidget(itemName: '我的邀请码', leftIcon: AssetsUtil.common.back_arrow),
        ItemWidget(itemName: '金币历史记录', leftIcon: AssetsUtil.common.back_arrow),
        ItemWidget(itemName: '设置', leftIcon: AssetsUtil.common.back_arrow),
        ItemWidget(itemName: '官方微信群', leftIcon: AssetsUtil.common.back_arrow),
        ItemWidget(itemName: '联系我们', leftIcon: AssetsUtil.common.back_arrow),
        ItemWidget(itemName: '当前版本', leftIcon: AssetsUtil.common.back_arrow),
      ],
    );
  }

  ///头像点击事件
  _onHeadClick() async {
    NavigatorUtil.goUserInfo(context);
  }

  ///金币
  _onWalletGoldClick() {}

  ///金元宝余额
  _onWalletWingClick() {}

  ///现金余额
  _onWalletClick() {}
}
