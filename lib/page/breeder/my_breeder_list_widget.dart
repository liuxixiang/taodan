import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:stacked/stacked.dart';
import 'package:taodan/common/config/tab_name.dart';
import 'package:taodan/common/values/colors.dart';
import 'package:taodan/common/values/dimens.dart';
import 'package:taodan/common/values/strings.dart';
import 'package:taodan/common/values/styles.dart';
import 'package:taodan/common/widgets/refresh_listview.dart';
import 'package:taodan/model/breeder_entity.dart';
import 'package:taodan/page/breeder/my_breeder_viewmodel.dart';
import 'package:taodan/utils/assets_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBreederListWidget extends ViewModelWidget<MyBreederViewModel> {
  String _tabName;

  MyBreederListWidget(this._tabName);

  @override
  Widget build(BuildContext context, MyBreederViewModel model) {
    // return _buildProductionTitle();
    return Container(
      padding: EdgeInsets.only(left: 8.w, right: 10.w),
      // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildProductionTitle(),
          Expanded(
              child: RefreshListView<Result>(
            onBuildListItem: (index, item) {
              return Container(
                padding: EdgeInsets.only(left: 2.w),
                margin: EdgeInsets.only(bottom: AppDimens.dpDefListMargin),
                child: _buildListItem(index, item),
              );
            },
            onRefresh: () async {
              return _getList(true, model);
            },
            onLoad: TabName.tabEmploy != _tabName
                ? () async {
                    return _getList(false, model);
                  }
                : null,
          ))
        ],
      ),
    );
  }

  _buildListItem(int index, Result item) {
    switch (_tabName) {
      case TabName.tabEmploy:
        return _buildEmploy(item);
      case TabName.tabEmploying:
        return _buildEmploying();
      case TabName.tabEmployed:
        return _buildEmployed();
    }
  }

  ///基础产量信息
  _buildProductionTitle() {
    return Container(
      padding: EdgeInsetsDirectional.only(
          top: AppDimens.dpDefPadding, bottom: AppDimens.dpDefPadding),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(AssetsUtil.common.ic_wing),
          SizedBox(width: 9.w),
          Expanded(
            child: Text('基础产量：0.3元宝/日'),
          ),
          Container(
            height: 25.h,
            child: OutlineButton(
              borderSide: BorderSide(
                  color: AppColors.yellow, width: AppDimens.dpDefLine),
              disabledBorderColor: AppColors.yellow,
              highlightedBorderColor: AppColors.yellow,
              child: Text(
                '详细说明',
                style: AppStyles.textSize13_yellow,
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }

  _buildEmploy(Result item) {
    if (item == null) return;
    double _rightW = 83.w;
    return Stack(
      alignment: AlignmentDirectional.center, //对齐方式,9个位置.
      // fit: StackFit.expand, //未定位widget占满Stack整个空间
      children: [
        Image.asset(
          AssetsUtil.breeder.bg_breeder_level,
          fit: BoxFit.cover,
        ),
        Positioned(
          left: 93.5.w,
          right: AppDimens.dpDefPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.name ?? "", style: AppStyles.textSize15_white),
              SizedBox(height: 5.h),
              Text("预计产出金元宝：${item.outPutGoldIngot}",
                  style: AppStyles.textSize12_white),
              SizedBox(height: 3.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('基础产量：+0.3金元宝/日', style: AppStyles.textSize12_white),
                  Container(
                    width: _rightW,
                    child: Text('雇佣人数：0/8', style: AppStyles.textSize12_white),
                  )
                ],
              ),
              SizedBox(height: 3.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('雇佣价格：0金元宝', style: AppStyles.textSize12_white),
                  Container(
                    width: _rightW,
                    child: Text('有效期：40天', style: AppStyles.textSize12_white),
                  )
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: AppDimens.dpDefPadding,
          right: AppDimens.dpDefPadding,
          width: _rightW,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(
                AssetsUtil.breeder.ic_breeder_employ,
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buildEmploying() {
    double _rightW = 83.w;
    return Stack(
      alignment: AlignmentDirectional.center, //对齐方式,9个位置.
      // fit: StackFit.expand, //未定位widget占满Stack整个空间
      children: [
        Image.asset(
          AssetsUtil.breeder.bg_breeder_level,
          fit: BoxFit.cover,
        ),
        Positioned(
          left: 93.5.w,
          right: AppDimens.dpDefPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('新手饲养员', style: AppStyles.textSize15_white),
              SizedBox(height: 5.h),
              Text('预计产出金元宝：12个', style: AppStyles.textSize12_white),
              SizedBox(height: 3.h),
              Text('基础产量：+0.3金元宝/日', style: AppStyles.textSize12_white),
              SizedBox(height: 3.h),
              Text('有效期：2020/08/31-2020/10/10',
                  style: AppStyles.textSize12_white),
              SizedBox(height: 3.h),
              Text('已产出金元宝：0.282个', style: AppStyles.textSize12_white),
            ],
          ),
        ),
      ],
    );
  }

  _buildEmployed() {
    return Stack(
      alignment: AlignmentDirectional.center, //对齐方式,9个位置.
      // fit: StackFit.expand, //未定位widget占满Stack整个空间
      children: [
        Image.asset(
          AssetsUtil.breeder.bg_breeder_level,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 12.5.w,
          right: AppDimens.dpSmallPadding,
          child: Image.asset(
            AssetsUtil.breeder.ic_overdue,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          left: 93.5.w,
          right: AppDimens.dpDefPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('新手饲养员', style: AppStyles.textSize15_white),
              SizedBox(height: 5.h),
              Text('预计产出金元宝：12个', style: AppStyles.textSize12_white),
              SizedBox(height: 3.h),
              Text('基础产量：+0.3金元宝/日', style: AppStyles.textSize12_white),
              SizedBox(height: 3.h),
              Text('有效期：2020/08/31-2020/10/10',
                  style: AppStyles.textSize12_white),
              SizedBox(height: 3.h),
              Text('已产出金元宝：0.282个', style: AppStyles.textSize12_white),
            ],
          ),
        ),
      ],
    );
  }

  Future<List<Result>> _getList(
      bool isRefresh, MyBreederViewModel model) async {
    return await model.findBreederInfo(isRefresh, "B");
  }
}
