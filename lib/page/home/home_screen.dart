import 'package:flutter/material.dart';
import 'package:taodan/utils/assets_util.dart';
import 'package:taodan/utils/yy_screen_util.dart';

class HomeScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<HomeScreen> {
  List<Widget> widgets = [];
  List<String> imgs = ["get_food", "feed", "feeder", "guide"];
  @override
  void initState() {
    imgs = ["get_food", "feed", "feeder", "guide"];
    for (var i = 0; i < imgs.length; i++) {
      // widgets.add(new Expanded(flex: 1, child: new Text("wendjia")));
      widgets.add(
          Image.asset(AssetsUtil.IMAGE_PATH + "index/" + imgs[i] + ".png"));
    }
    // widgets.add();

    // Image.asset(
    //           AssetsUtil.IMAGE_PATH + "index/" + imgs[i] + ".png")));
    super.initState();
  }

  Widget bg = Image.asset(
    AssetsUtil.IMAGE_PATH + "index/index_bg.png",
    width: YYScreenUtil.setWidth(375),
    fit: BoxFit.cover,
  );
  Widget chicken = Positioned(
    left: YYScreenUtil.setWidth(29),
    top: YYScreenUtil.setHeight(300.5),
    child: Image.asset(
      AssetsUtil.IMAGE_PATH + "index/index_chicken.png",
      height: YYScreenUtil.setHeight(130),
    ),
  );
  Widget feeder = Positioned(
    right: YYScreenUtil.setWidth(57),
    top: YYScreenUtil.setHeight(279),
    child: Image.asset(
      AssetsUtil.IMAGE_PATH + "index/people.png",
      height: YYScreenUtil.setHeight(120),
    ),
  );
  Widget egg = Positioned(
    left: YYScreenUtil.setWidth(25.2),
    top: YYScreenUtil.setHeight(452),
    child: Image.asset(
      AssetsUtil.IMAGE_PATH + "index/egg.png",
      height: YYScreenUtil.setHeight(56),
    ),
  );
  Widget goldEgg = Positioned(
    left: YYScreenUtil.setWidth(118.5),
    top: YYScreenUtil.setHeight(452),
    child: Image.asset(
      AssetsUtil.IMAGE_PATH + "index/gold_egg.png",
      height: YYScreenUtil.setHeight(56),
    ),
  );
  @override
  Widget build(BuildContext context) {
    print(YYScreenUtil.setWidth(375));
    return Stack(
      children: [
        bg,
        chicken,
        feeder,
        egg,
        goldEgg,
        Positioned(
          width: YYScreenUtil.setWidth(375),
          bottom: YYScreenUtil.setHeight(14.9),
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: widgets,
          ),
        )
      ],
    );
  }
}
