import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:taodan/common/values/colors.dart';
import 'package:taodan/common/values/styles.dart';
import 'package:taodan/common/widgets/button_widget.dart';
import 'package:taodan/common/widgets/title_widget.dart';
import 'package:taodan/page/reward/item_content_widget.dart';
import 'package:taodan/page/reward/lever_progress_widget.dart';
import 'package:taodan/page/reward/reward_viewmodel.dart';
import 'package:taodan/utils/assets_util.dart';
import 'package:taodan/utils/log_util.dart';
import 'package:taodan/utils/toast_utils.dart';

class RewardSence extends StatefulWidget {
  @override
  _RewardSenceState createState() => _RewardSenceState();
}

class _RewardSenceState extends State<RewardSence>
    with SingleTickerProviderStateMixin {
  List<Widget> _myTabs = List();
  TabController _tabController; //需要定义一个Controller

  @override
  void initState() {
    super.initState();
    _myTabs
      ..add(_buildPersonageGold())
      ..add(_buildGroupGold())
      ..add(_buildAddGold());
    // 创建Controller
    _tabController = TabController(length: _myTabs.length, vsync: this);
  }

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
        Container(
          margin: EdgeInsets.only(top: 10.h),
          padding:
              EdgeInsets.only(top: 8.h, left: 11.w, right: 11.w, bottom: 7.h),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: AppColors.gray_f0),
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
        Container(
          margin: EdgeInsets.only(top: 10.h),
          padding:
              EdgeInsets.only(top: 8.h, left: 11.w, right: 11.w, bottom: 7.h),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: AppColors.gray_f0),
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
        Container(
          margin: EdgeInsets.only(top: 10.h),
          padding:
              EdgeInsets.only(top: 8.h, left: 11.w, right: 11.w, bottom: 7.h),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: AppColors.gray_f0),
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
      children: [
        TitleWidget(
          title: '金元宝(0%)',
        ),
      ],
    );
  }

  Widget _buildGroupGold() {
    return Column(
      children: [
        TitleWidget(
          title: '金元宝(0%)',
        ),
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

  Widget _buildAddGold() {
    return Column(
      children: [
        TitleWidget(
          title: '金元宝(0%)',
        ),
      ],
    );
  }
}
