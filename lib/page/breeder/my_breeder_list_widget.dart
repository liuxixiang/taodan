import 'package:cached_network_image/cached_network_image.dart';
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
import 'package:taodan/common/widgets/td_cache_network_image.dart';
import 'package:taodan/model/breeder_entity.dart';
import 'package:taodan/page/breeder/my_breeder_viewmodel.dart';
import 'package:taodan/page/widgets/dialog/dialog_chicken_name.dart';
import 'package:taodan/page/widgets/dialog/dialog_employ.dart';
import 'package:taodan/utils/assets_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taodan/utils/object_utils.dart';

class MyBreederListWidget extends ViewModelWidget<MyBreederViewModel> {
  String _tabName;

  MyBreederListWidget(this._tabName);

  MyBreederViewModel _model;
  BuildContext _context;

  @override
  Widget build(BuildContext context, MyBreederViewModel model) {
    this._model = model;
    _context = context;
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
              child: RefreshListView<BreederInfoEntity>(
                  enableLoad: TabName.tabEmploy != _tabName,
                  onBuildListItem: (index, item) {
                    return Container(
                      padding: EdgeInsets.only(left: 2.w),
                      margin:
                          EdgeInsets.only(bottom: AppDimens.dpDefListMargin),
                      child: _buildListItem(index, item),
                    );
                  },
                  onRefresh: () async {
                    return _getList(true, model);
                  },
                  onLoad: () async {
                    return _getList(false, model);
                  }))
        ],
      ),
    );
  }

  _buildListItem(int index, BreederInfoEntity item) {
    switch (_tabName) {
      case TabName.tabEmploy:
        return _buildEmploy(item);
      case TabName.tabEmploying:
        return _buildEmploying(item);
      case TabName.tabEmployed:
        return _buildEmployed(item);
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

  _buildEmploy(BreederInfoEntity item) {
    if (item == null) return;
    double _rightW = 83.w;
    return Stack(
      alignment: AlignmentDirectional.center, //对齐方式,9个位置.
      // fit: StackFit.expand, //未定位widget占满Stack整个空间
      children: [
        TdCacheNetworkImage(
          url: item.backgroundUrl,
          errPath: AssetsUtil.breeder.bg_breeder_level,
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
                  Text('基础产量：+${item.baseOut}金元宝/日',
                      style: AppStyles.textSize12_white),
                  Container(
                    width: _rightW,
                    child: Text('雇佣人数：${item.userHireNum}/${item.hireNum}',
                        style: AppStyles.textSize12_white),
                  )
                ],
              ),
              SizedBox(height: 3.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('雇佣价格：${item.hirePrice}金元宝',
                      style: AppStyles.textSize12_white),
                  Container(
                    width: _rightW,
                    child: Text('有效期：${item.validityDate}天',
                        style: AppStyles.textSize12_white),
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
          child: GestureDetector(
            onTap: () => _showEmployDialog(_context, item),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              TdCacheNetworkImage(
                url: item.buttonUrl,
                errPath: AssetsUtil.breeder.ic_breeder_employ,
              )
            ]),
          ),
        ),
      ],
    );
  }

  _buildEmploying(BreederInfoEntity item) {
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

  _buildEmployed(BreederInfoEntity item) {
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

  _showEmployDialog(BuildContext context, BreederInfoEntity bean) {
    _model.checkExchangeBreeder(bean.breederType, (data) {
      //Future类型,then或者await获取
      showDialog(
          context: context,
          builder: (context) {
            return EmployDialog(bean.name, data.hirePrice, data.canHiriCount,() {
              _model.addBreederInfo(bean.breederType, (breeder) => null);
            });
          });
    });
  }

  Future<List<BreederInfoEntity>> _getList(
      bool isRefresh, MyBreederViewModel model) async {
    ///B 雇佣    Y   雇佣中     N    已过期
    String type = "";
    switch (_tabName) {
      case TabName.tabEmploy:
        type = "B";
        break;
      case TabName.tabEmploying:
        type = "Y";
        break;
      case TabName.tabEmployed:
        type = "N";
        break;
    }
    return await model.findBreederInfo(isRefresh, type);
  }
}
