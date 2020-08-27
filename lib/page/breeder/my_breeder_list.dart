import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taodan/common/config/tab_name.dart';
import 'package:taodan/common/values/colors.dart';
import 'package:taodan/common/values/dimens.dart';
import 'package:taodan/common/values/strings.dart';
import 'package:taodan/common/values/styles.dart';
import 'package:taodan/common/widgets/refresh_listview.dart';
import 'package:taodan/utils/assets_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBreederList extends StatefulWidget {
  String _tabName;

  MyBreederList(this._tabName);

  @override
  _MyBreederListState createState() => _MyBreederListState();
}

class _MyBreederListState extends State<MyBreederList> {
  @override
  Widget build(BuildContext context) {
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
              child: RefreshListView(
            onBuildListItem: (index, item) {
              return Container(
                padding: EdgeInsets.only(left: 2.w),
                margin: EdgeInsets.only(bottom: AppDimens.dpDefListMargin),
                child: _buildListItem(index, item),
              );
            },
            onRefresh: () async {
              return _getList();
            },
            onLoad: () async {
              return _getList();
            },
          ))
        ],
      ),
    );
  }

  _buildListItem(int index, dynamic item) {
    switch (widget._tabName) {
      case TabName.tabEmploy:
        return _buildEmploy();
      case TabName.tabEmploying:
        return Center(child: Icon(Icons.add));
      case TabName.tabEmployed:
        return Center(child: Text(item ?? ""));
    }
  }

  ///基础产量信息
  _buildProductionTitle() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Image.asset(AssetsUtil.common_path + "ic_wing.png"),
        Expanded(
          child: Text('基础产量：0.3元宝/日'),
        ),
        Container(
          height: 25.h,
          child: OutlineButton(
            borderSide:
                BorderSide(color: AppColors.yellow, width: AppDimens.dpDefLine),
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
    );
  }

  _buildEmploy() {
    double _rightW = 83.w;
    return Stack(
      alignment: AlignmentDirectional.center, //对齐方式,9个位置.
      // fit: StackFit.expand, //未定位widget占满Stack整个空间
      children: [
        Image.asset(
          AssetsUtil.breeder_path + 'bg_breeder_level.png',
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
                AssetsUtil.breeder_path + 'ic_breeder_employ.png',
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buildEmploying() {}

  _buildEmployed() {}

  List<dynamic> _getList() {
    return ['hahah', 'heheh'];
  }
}
