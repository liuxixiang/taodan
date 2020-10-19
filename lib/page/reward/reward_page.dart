import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:taodan/common/values/colors.dart';
import 'package:taodan/common/values/styles.dart';
import 'package:taodan/common/widgets/button_widget.dart';
import 'package:taodan/common/widgets/title_widget.dart';
import 'package:taodan/page/reward/item_content_widget.dart';
import 'package:taodan/page/reward/lever_progress_widget.dart';
import 'package:taodan/page/reward/reward_item_content_widget.dart';
import 'package:taodan/page/reward/reward_viewmodel.dart';
import 'package:taodan/router/navigator_util.dart';
import 'package:taodan/utils/assets_util.dart';

class RewardSence extends StatefulWidget {
  @override
  _RewardSenceState createState() => _RewardSenceState();
}

class _RewardSenceState extends State<RewardSence>
    with SingleTickerProviderStateMixin {
  List<Widget> _myTabs = List();
  TabController _tabController; //需要定义一个Controller
  RewardViewModel _model;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RewardViewModel>.reactive(
        // 如果您只想触发初始化逻辑，则可以设置一次initialiseSpecialViewModelsOnce: true
        // initialiseSpecialViewModelsOnce: true,
        // disposeViewModel: false,
        viewModelBuilder: () => RewardViewModel(),
        onModelReady: (model) {
          this._model = model;
          _myTabs
            ..add(_buildPersonageGold())
            ..add(_buildGroupGold())
            ..add(_buildAddGold());
          // 创建Controller
          _tabController = TabController(length: _myTabs.length, vsync: this);
          _tabController.addListener(() {
            model.tabIndex = _tabController.index;
            model.notifyListeners();
          });
        },
        builder: (context, model, child) => Column(
              children: [
                _buildToolBar(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            _buildGroupLever(model),
                            Padding(
                              padding: EdgeInsets.only(left: 15.w, right: 15.w),
                              child: Column(
                                children: [
                                  _buildCashBonus(model),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  _buildGoldIngot(model),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  _buildGold(model),
                                  _buildTabBar()
                                ],
                              ),
                            )
                          ],
                        )),
                  ),
                )
              ],
            ));
  }

  _buildToolBar() {
    return Container(
      color: AppColors.yellow,
      height: 64.h,
      child: Stack(
        children: [
          Positioned.fill(
            bottom: 10,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Text(
                  '收益中心',
                  style: AppStyles.textSize18_white,
                ),
                Positioned(
                    bottom: 2.h,
                    right: 10.w,
                    child: GestureDetector(
//              onTap: () => _clickSave(context, model),
                      child: Center(
                        child: Row(children: [
                          Image.asset(AssetsUtil.reward.historical_earnings),
                          SizedBox(width: 8.w),
                          Text(
                            '历史收益',
                            style: AppStyles.textSize15_white,
                          )
                        ]),
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildGroupLever(RewardViewModel model) {
    return Stack(
      children: [
        Image.asset(AssetsUtil.reward.bg_group_lever),
        Padding(
          padding: EdgeInsets.only(
              top: 20.h, bottom: 17.h, left: 15.w, right: 115.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '赚金币赢现金分红，分红越多',
                style: AppStyles.textSize18_white,
              ),
              SizedBox(
                height: 13.h,
              ),
              Row(
                children: [
                  Text(
                    '团队活跃等级 LV2',
                    style: AppStyles.textSize12_white,
                  ),
                  Spacer(),
                  Text(
                    '详细规则 >',
                    style: AppStyles.textSize13_white,
                  ),
                ],
              ),
              SizedBox(
                height: 14.5.h,
              ),
              LeverProgressWidget(
                progress: 5,
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buildCashBonus(RewardViewModel model) {
    return Column(
      children: [
        Row(
          children: [
            TitleWidget(
              title: '现金分红',
            ),
            SizedBox(
              width: 8.w,
            ),
            GestureDetector(
                onTap: () {},
                child: Image.asset(AssetsUtil.common.ic_question)),
          ],
        ),
        RewardItemContentWidget(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: ItemContentWidget(
                      title: '今日分红(元)',
                      titleStyle: AppStyles.textSize13_gray_66,
                      contentStyle: AppStyles.textSize23_yellow,
                      content: '275',
                    ),
                  ),
                  SizedBox(
                    width: 17.w,
                  ),
                  Expanded(
                    child: ItemContentWidget(
                      title: '累计分红(元)',
                      titleStyle: AppStyles.textSize13_gray_66,
                      contentStyle: AppStyles.textSize23_yellow,
                      content: '1,875',
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              ButtonWidget(
                height: 25.h,
                color: AppColors.yellow,
                borderSideRadius: 5.w,
                borderSideWidth: 0,
                onPressed: () {},
                text: '提现',
              )
            ],
          ),
        )
      ],
    );
  }

  ///金元宝
  _buildGoldIngot(RewardViewModel model) {
    return Column(
      children: [
        Row(
          children: [
            TitleWidget(
              title: '金元宝(0%)',
            ),
            SizedBox(
              width: 8.w,
            ),
            GestureDetector(
                onTap: () {},
                child: Image.asset(AssetsUtil.common.ic_question)),
          ],
        ),
        RewardItemContentWidget(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: ItemContentWidget(
                      title: '基础产量',
                      content: '0.6',
                      unit: '(金元宝/日)',
                    ),
                  ),
                  SizedBox(
                    width: 11.5.w,
                  ),
                  Expanded(
                    child: ItemContentWidget(
                      title: '助力产量',
                      content: '100.60000',
                      unit: '(金元宝/日)',
                    ),
                  ),
                  SizedBox(
                    width: 11.5.w,
                  ),
                  Expanded(
                    child: ItemContentWidget(
                      title: '活跃度奖励',
                      content: '100.60000',
                      unit: '(金元宝)',
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              ButtonWidget(
                height: 25.h,
                color: AppColors.yellow,
                borderSideRadius: 5.w,
                borderSideWidth: 0,
                onPressed: () {},
                text: '查看余额',
              )
            ],
          ),
        )
      ],
    );
  }

  ///金币
  _buildGold(RewardViewModel model) {
    return Column(
      children: [
        Row(
          children: [
            TitleWidget(
              title: '我的金币',
            ),
            SizedBox(
              width: 8.w,
            ),
            GestureDetector(
                onTap: () {},
                child: Image.asset(AssetsUtil.common.ic_question)),
          ],
        ),
        RewardItemContentWidget(
          child: Column(
            children: [
              Row(
                children: [
                  _buildItemContentWidget(model, 0, '个人金币', '600'),
                  SizedBox(
                    width: 11.5.w,
                  ),
                  _buildItemContentWidget(model, 1, '团队金币', '600'),
                  SizedBox(
                    width: 11.5.w,
                  ),
                  _buildItemContentWidget(model, 2, '加成金币', '600'),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  //
  _buildTabBar() {
    return Container(
        height: 200.h,
        child: TabBarView(controller: _tabController, children: _myTabs));
  }

  Widget _buildPersonageGold() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 4.h,
        ),
        Padding(
            padding: EdgeInsets.only(left: 11.w),
            child: Text(
              '当日获取饲料>200G,才可以参与当天分红',
              style: AppStyles.textSize12_gray_99,
            )),
        SizedBox(
          height: 15.h,
        ),
        TitleWidget(
          title: '喂养小鸡获得鸡蛋，砸蛋领金币',
        ),
        SizedBox(
          height: 8.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          decoration: new BoxDecoration(
            border: new Border.all(color: AppColors.gray_db, width: 1.w),
            // 边色与边宽度
            color: Colors.white,
            // 底色
            //        shape: BoxShape.circle, // 圆形，使用圆形时不可以使用borderRadius
            shape: BoxShape.rectangle,
            // 默认值也是矩形
            borderRadius: BorderRadius.circular(5.w),
            // 圆角
            // 边色与边宽度
// 生成俩层阴影，一层绿，一层黄， 阴影位置由offset决定,阴影模糊层度由blurRadius大小决定（大就更透明更扩散），阴影模糊大小由spreadRadius决定
            boxShadow: [
              BoxShadow(
                color: AppColors.gray_94,
                offset: Offset(0, 1.w),
              ),
            ],
          ),
          height: 40.h,
          child: Row(
            children: [
              Text(
                '我的鸡蛋',
                style: AppStyles.textSize15_black_33,
              ),
              Expanded(
                child: Center(
                  child: Text(
                    '1',
                    style: AppStyles.textSize15_black_33,
                  ),
                ),
              ),
              ButtonWidget(
                height: 24.h,
                width: 90.w,
                text: '去砸蛋',
                borderSideWidth: 0,
                onPressed: () {
                  NavigatorUtil.goThrowingEgg(context);
                },
              )
            ],
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          decoration: new BoxDecoration(
            border: new Border.all(color: AppColors.gray_db, width: 1.w),
            // 边色与边宽度
            color: Colors.white,
            // 底色
            //        shape: BoxShape.circle, // 圆形，使用圆形时不可以使用borderRadius
            shape: BoxShape.rectangle,
            // 默认值也是矩形
            borderRadius: BorderRadius.circular(5.w),
            // 圆角
            // 边色与边宽度
// 生成俩层阴影，一层绿，一层黄， 阴影位置由offset决定,阴影模糊层度由blurRadius大小决定（大就更透明更扩散），阴影模糊大小由spreadRadius决定
            boxShadow: [
              BoxShadow(
                color: AppColors.gray_94,
                offset: Offset(0, 1.w),
              ),
            ],
          ),
          height: 40.h,
          child: Row(
            children: [
              Text(
                '我的饲料',
                style: AppStyles.textSize15_black_33,
              ),
              Expanded(
                child: Center(
                  child: Text(
                    '200G',
                    style: AppStyles.textSize15_black_33,
                  ),
                ),
              ),
              ButtonWidget(
                height: 24.h,
                width: 90.w,
                text: '去喂鸡',
                borderSideWidth: 0,
                onPressed: () {},
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildGroupGold() {
    return Column(
      children: [
        RewardItemContentWidget(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: ItemContentWidget(
                      title: '邀请总人数',
                      content: '56',
                    ),
                  ),
                  SizedBox(
                    width: 13.w,
                  ),
                  Expanded(
                    child: ItemContentWidget(
                      title: '活跃好友数',
                      content: '20',
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildAddGold() {
    return Column(
      children: [
        RewardItemContentWidget(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: ItemContentWidget(
                      title: '今日投入金元宝',
                      content: '56',
                    ),
                  ),
                  SizedBox(
                    width: 13.w,
                  ),
                  Expanded(
                    child: ItemContentWidget(
                      title: '获得加成金币',
                      content: '20',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              ButtonWidget(
                height: 25.h,
                color: AppColors.yellow,
                borderSideWidth: 0,
                onPressed: () {},
                text: '投入金元宝，获得加成金币',
              )
            ],
          ),
        )
      ],
    );
  }

  _buildItemContentWidget(
      RewardViewModel model, int index, String title, String content) {
    return Expanded(
      child: ItemContentWidget(
        onTap: () {
          _tabController.index = index;
        },
        color: model.tabIndex == index ? AppColors.yellow : Colors.white,
        title: title,
        titleStyle: model.tabIndex == index
            ? AppStyles.textSize12_white
            : AppStyles.textSize12_gray_66,
        content: content,
        contentStyle: model.tabIndex == index
            ? AppStyles.textSize18_white
            : AppStyles.textSize18_yellow,
      ),
    );
  }
}
