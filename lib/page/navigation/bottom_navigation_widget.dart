import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:taodan/page/navigation/bottom_navigation_viewmodel.dart';
import 'package:taodan/page/home/home_page.dart';
import 'package:taodan/page/home/meassage_page.dart';
import 'package:taodan/page/home/mine_page.dart';
import 'package:taodan/page/home/reward_page.dart';
import 'package:taodan/page/home/wheel_draw_page.dart';
import 'package:taodan/utils/assets_util.dart';

class BottomNavigationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BottomNavigationWidgetState();
}

class BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  List<Widget> list = List();
  List<String> names = List();
  List<String> images = List();

  @override
  void initState() {
    list
      ..add(HomeScreen())
      ..add(WheelDrawSence())
      ..add(RewardSence())
      ..add(MessageSence())
      ..add(MineSence());
    names..add("首页")..add("转盘")..add("收益")..add("消息")..add("我的");
    images
      ..add("index_icon")
      ..add("wheel_draw_icon")
      ..add("reward_icon")
      ..add("message_icon")
      ..add("mine_icon");

    super.initState();
  }

  List<BottomNavigationBarItem> getItems(int currentIndex) {
    List<BottomNavigationBarItem> bottomNavigationBarItems = [];
    for (int i = 0; i < names.length; i++) {
      bottomNavigationBarItems.add(new BottomNavigationBarItem(
          icon: currentIndex == i
              ? Image.asset(
                  AssetsUtil.IMAGE_PATH + "bottomnav/" + images[i] + "_sel.png")
              : Image.asset(
                  AssetsUtil.IMAGE_PATH + "bottomnav/" + images[i] + "_un.png"),
          title: new Text(
            names[i],
          )));
    }
    return bottomNavigationBarItems;
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomNavigationViewModel>.reactive(
      viewModelBuilder: () => BottomNavigationViewModel(),
      builder: (context, model, child) => Scaffold(
        body: list[model.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: getItems(model.currentIndex),
          currentIndex: model.currentIndex,
          onTap: model.setIndex,
          fixedColor: Colors.amber[800],
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
