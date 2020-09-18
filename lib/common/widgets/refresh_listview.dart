import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:taodan/common/values/strings.dart';
import 'package:taodan/common/values/styles.dart';
import 'package:taodan/utils/assets_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef RefreshCallback<T> = Future<List<T>> Function();
typedef LoadMoreCallback<T> = Future<List<T>> Function();
typedef BuildListItem<T> = Widget Function(int, T);

class RefreshListView<T> extends StatefulWidget {
  const RefreshListView({
    Key key,
    @required this.onBuildListItem,
    this.onRefresh,
    this.onLoad,
    this.controller,
    this.enableRefresh = true,
    this.enableLoad = false,
    this.emptyWidget,
    this.wantKeepAlive = true,
  }) : super(key: key);

  final RefreshCallback<T> onRefresh;
  final LoadMoreCallback<T> onLoad;
  final BuildListItem<T> onBuildListItem;
  final bool enableLoad;
  final bool enableRefresh;
  final Widget emptyWidget;
  final bool wantKeepAlive;
  final EasyRefreshController controller;

  @override
  _RefreshListViewState createState() => _RefreshListViewState<T>();
}

class _RefreshListViewState<T> extends State<RefreshListView<T>>
    with AutomaticKeepAliveClientMixin {
  EasyRefreshController _controller;

  @override
  void initState() {
    _controller = widget.controller ?? EasyRefreshController();
    super.initState();
  }

  List<T> _items = List();

  // 条目总数
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return _buildRefresh();
  }

  _buildRefresh() {
    return EasyRefresh.custom(
      ///首次刷新
      firstRefresh: true,

      ///是否开启控制结束刷新
      enableControlFinishRefresh: false,

      ///是否开启控制结束加载
      enableControlFinishLoad: false,

      controller: widget.controller,
      header: widget.enableRefresh ? ClassicalHeader() : null,
      footer: widget.enableLoad ? ClassicalFooter() : null,
      emptyWidget: _count == 0 ? _buildEmptyWidget() : null,
      onRefresh: widget.enableRefresh
          ? () async {
              if (widget.onRefresh != null) {
                List<T> refreshItems = await widget.onRefresh();
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
              List<T> loadItems = await widget.onLoad();
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
      slivers: <Widget>[SliverList(
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
              AssetsUtil.common.no_data,
            ),
            Text(AppStrings.noData, style: AppStyles.textSize16_99)
          ]),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => widget.wantKeepAlive;
}
