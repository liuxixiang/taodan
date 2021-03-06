import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:taodan/model/bottom_nav_view_data.dart';
import 'package:taodan/page/mine/mine_page.dart';
import 'package:taodan/page/navigation/bottom_navigation_viewmodel.dart';
import 'package:taodan/page/home/home_page.dart';
import 'package:taodan/page/home/meassage_page.dart';
import 'package:taodan/page/reward/reward_page.dart';
import 'package:taodan/state/egg_state.dart';
import 'package:taodan/utils/assets_util.dart';

class BottomNavigationWidget extends StatelessWidget {
  List<BottomNavViewData> datas = List();

  @override
  Widget build(BuildContext context) {
    datas
      ..add(BottomNavViewData(HomeScreen(), "首页", "index_icon"))
      // ..add(BottomNavViewData(WheelDrawSence(), "转盘", "wheel_draw_icon"))
      ..add(BottomNavViewData(RewardSence(), "收益", "reward_icon"))
      ..add(BottomNavViewData(MessageSence(), "消息", "message_icon"))
      ..add(BottomNavViewData(MinePage(), "我的", "mine_icon"));

    return ViewModelBuilder<BottomNavigationViewModel>.reactive(
      viewModelBuilder: () => BottomNavigationViewModel(),
      builder: (context, model, child) => Scaffold(
          body: datas[model.currentIndex].widget,
          bottomNavigationBar: BottomNavigationBar(
            items: getItems(model.currentIndex),
            currentIndex: model.currentIndex,
            onTap: model.setIndex,
            fixedColor: Colors.amber[800],
            type: BottomNavigationBarType.fixed,
          )),
    );
  }

  List<BottomNavigationBarItem> getItems(int currentIndex) {
    List<BottomNavigationBarItem> bottomNavigationBarItems = [];
    for (int i = 0; i < datas.length; i++) {
      bottomNavigationBarItems.add(new BottomNavigationBarItem(
          icon: currentIndex == i
              ? Image.asset(
                  AssetsUtil.bottomnav.path + datas[i].url + "_sel.png")
              : Image.asset(
                  AssetsUtil.bottomnav.path + datas[i].url + "_un.png"),
          title: new Text(
            datas[i].name,
          )));
    }
    return bottomNavigationBarItems;
  }
}
