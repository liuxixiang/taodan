import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

typedef RefreshCallback = Future<List<dynamic>> Function();
typedef LoadMoreCallback = Future<List<dynamic>> Function();
typedef BuildListItem = Widget Function();

class RefreshListView extends StatefulWidget {
  const RefreshListView({
    Key key,
    @required this.onBuildListItem,
    this.onRefresh,
    this.onLoad,
    this.enableLoad = false,
    this.enableRefresh,
  }) : super(key: key);

  final RefreshCallback onRefresh;
  final LoadMoreCallback onLoad;
  final BuildListItem onBuildListItem;
  final bool enableLoad;
  final bool enableRefresh;

  @override
  _RefreshListViewState createState() => _RefreshListViewState();
}

class _RefreshListViewState extends State<RefreshListView> {
  EasyRefreshController _controller;
  // 条目总数
  int _count = 20;

  @override
  Widget build(BuildContext context) {
    return _buildRefresh();
  }

  _buildRefresh() {
    return EasyRefresh.custom(
      enableControlFinishRefresh: false,
      enableControlFinishLoad: true,
      controller: _controller,
      header: widget.enableRefresh ? ClassicalHeader() : null,
      footer: widget.enableLoad ? ClassicalFooter() : null,
      onRefresh: widget.enableRefresh ? () async {
          if(widget.onRefresh != null){
            List<dynamic> list = await widget.onRefresh();
            if(list.isNotEmpty) {
              setState(() {
                _count = list.length;
              });
            }
//            if (!_enableControlFinish) {
              _controller.resetLoadState();
              _controller.finishRefresh();
//            }
          }
      } : null,
      onLoad: widget.enableLoad ? () async {
        List<dynamic> list = await widget.onLoad();
        if(list.isNotEmpty) {
          setState(() {
            _count = _count + list.length;
          });
        }
//        if (!_enableControlFinish) {
//          _controller.finishLoad(noMore: _count >= 80);
//        }
      } : null,
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              return widget.onBuildListItem();
            },
            childCount: _count,
          ),
        ),
      ],
    );
  }
}
