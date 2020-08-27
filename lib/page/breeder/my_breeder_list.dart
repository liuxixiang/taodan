import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taodan/common/config/tab_name.dart';
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
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildProductionTitle(),
          Expanded(
              child: RefreshListView(
            onBuildListItem: (index, item) {
              return _buildListItem(index, item);
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
        Image.asset(AssetsUtil.index_path + "user_level.png"),
        Expanded(
          child: Text('基础产量：0.3元宝/日'),
        ),
        OutlineButton(
          borderSide: BorderSide(color: Colors.blue, width: 2),
          disabledBorderColor: Colors.black,
          highlightedBorderColor: Colors.red,
          child: Text('Button'),
          onPressed: () {},
        )
      ],
    );
  }

  _buildEmploy() {
    return Stack(
      // fit: StackFit.expand, //未定位widget占满Stack整个空间
      children: [
        Image.asset(
          AssetsUtil.breeder_path + 'bg_breeder_level.png',
          width: 375.w,
          fit: BoxFit.cover,
        ),
        Positioned(
          child: Column(
            children: [
              Text('新手饲养员', style: AppStyles.textSize15_white),
              // Text('预计产出金元宝：12个', style: AppStyles.textSize12_white),
              // Text('基础产量：+0.3金元宝/日', style: AppStyles.textSize12_white),
              // Text('雇佣价格：0金元宝', style: AppStyles.textSize12_white)
            ],
          ),
        )
      ],
    );
  }

  _buildEmploying() {}

  _buildEmployed() {}

  List<dynamic> _getList() {
    return ['hahah', 'heheh'];
  }
}
