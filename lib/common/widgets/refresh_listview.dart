import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:taodan/common/values/strings.dart';
import 'package:taodan/common/values/styles.dart';
import 'package:taodan/utils/assets_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef RefreshCallback = Future<List<dynamic>> Function();
typedef LoadMoreCallback = Future<List<dynamic>> Function();
typedef BuildListItem = Widget Function(int, dynamic);

class RefreshListView extends StatefulWidget {
  const RefreshListView({
    Key key,
    @required this.onBuildListItem,
    this.onRefresh,
    this.onLoad,
    this.enableRefresh = true,
    this.enableLoad = false,
    this.emptyWidget,
  }) : super(key: key);

  final RefreshCallback onRefresh;
  final LoadMoreCallback onLoad;
  final BuildListItem onBuildListItem;
  final bool enableLoad;
  final bool enableRefresh;
  final Widget emptyWidget;

  @override
  _RefreshListViewState createState() => _RefreshListViewState();
}

class _RefreshListViewState extends State<RefreshListView> {
  EasyRefreshController _controller;
  List<dynamic> _items = [];

  // 条目总数
  int _count;

  @override
  Widget build(BuildContext context) {
    return _buildRefresh();
  }

  _buildRefresh() {
    return EasyRefresh.custom(
      firstRefresh: true,

      ///首次刷新
      enableControlFinishRefresh: false,

      ///是否开启控制结束刷新
      enableControlFinishLoad: false,

      ///是否开启控制结束加载
      controller: _controller,
      header: widget.enableRefresh ? ClassicalHeader() : null,
      footer: widget.enableLoad ? ClassicalFooter() : null,
      emptyWidget: _count == 0 ? _buildEmptyWidget() : null,
      onRefresh: widget.enableRefresh
          ? () async {
              if (widget.onRefresh != null) {
                List<dynamic> refreshItems = await widget.onRefresh();
                if (refreshItems.isNotEmpty) {
                  setState(() {
                    _count = refreshItems.length;
                    _items.clear();
                    _items.addAll(refreshItems);
                  });
                }
//            if (!_enableControlFinish) {
//                _controller.resetLoadState();
//                _controller.finishRefresh();
//            }，
              }
            }
          : null,
      onLoad: widget.enableLoad
          ? () async {
              List<dynamic> loadItems = await widget.onLoad();
              if (loadItems.isNotEmpty) {
                setState(() {
                  _count = _count + loadItems.length;
                  _items.addAll(loadItems);
                });
              }
//        if (!_enableControlFinish) {
//          _controller.finishLoad(noMore: _count >= 80);
//        }
            }
          : null,
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return widget.onBuildListItem(
                  index, _items.isNotEmpty ? _items[index] : null);
            },
            childCount: _count,
          ),
        ),
      ],
    );
  }

  _buildEmptyWidget() {
    return Container(
      margin: EdgeInsets.only(top: 87.5.h), //容器外填充
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              AssetsUtil.IMAGE_PATH + "common/no_data.png",
            ),
            Text(AppStrings.noData, style: AppStyles.textSize16_99)
          ]),
    );
  }
}
