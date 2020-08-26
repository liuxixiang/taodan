import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taodan/common/config/tab_name.dart';
import 'package:taodan/common/widgets/refresh_listview.dart';
import 'package:taodan/utils/assets_util.dart';

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
        return Center(child: Text(item ?? ""));
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

  _buildEmploy() {}

  _buildEmploying() {}

  _buildEmployed() {}

  List<dynamic> _getList() {
    return ['hahah', 'heheh'];
  }
}
