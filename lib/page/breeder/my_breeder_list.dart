import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taodan/common/config/tab_name.dart';
import 'package:taodan/common/widgets/refresh_listview.dart';

class MyBreederList extends StatefulWidget {
  String _tabName;

  MyBreederList(this._tabName);

  @override
  _MyBreederListState createState() => _MyBreederListState();
}

class _MyBreederListState extends State<MyBreederList> {
  @override
  Widget build(BuildContext context) {
    return RefreshListView(
      onBuildListItem: (index, item) {
        return _buildListItem(index, item);
      },
      onRefresh: () async {
        return _getList();
      },
      onLoad: () async {
        return _getList();
      },
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

  List<dynamic> _getList() {
    return ['hahah', 'heheh'];
  }
}
