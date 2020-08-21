import 'package:flutter/material.dart';
import 'package:taodan/ui/widget/progress_widget.dart';
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
      widgets.add(Image.asset(
        AssetsUtil.IMAGE_PATH + "index/" + imgs[i] + ".png",
      ));
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
    child: Column(
      children: [
        Image.asset(
          AssetsUtil.IMAGE_PATH + "index/egg.png",
          height: YYScreenUtil.setHeight(56),
        ),
        ProgressWidget(80),
      ],
    ),
  );
  Widget goldEgg = Positioned(
      left: YYScreenUtil.setWidth(118.5),
      top: YYScreenUtil.setHeight(452),
      child: Column(
        children: [
          Image.asset(
            AssetsUtil.IMAGE_PATH + "index/gold_egg.png",
            height: YYScreenUtil.setHeight(56),
          ),
          ProgressWidget(80),
        ],
      ));
  @override
  Widget build(BuildContext context) {
    Widget userHead = Positioned(
      top: YYScreenUtil.setHeight(35),
      left: YYScreenUtil.setWidth(15),
      child: Stack(
        fit: StackFit.loose,
        overflow: Overflow.visible,
        alignment: Alignment.centerLeft,
        children: [
          Positioned(
            left: YYScreenUtil.setWidth(35) / 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                color: Color(0x28127EB3),
                width: YYScreenUtil.setWidth(101.5),
                height: YYScreenUtil.setHeight(35),
                child: Center(
                  child: Text(
                    "用户姓名",
                    style: TextStyle(
                        fontSize: YYScreenUtil.setSp(13), color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Image.asset(
            AssetsUtil.index_path + "head_icon.png",
            width: YYScreenUtil.setWidth(35),
            height: YYScreenUtil.setWidth(35),
          ),
        ],
      ),
    );
    // Widget userLevel = Positioned(
    //   top: YYScreenUtil.setHeight(36),
    //   left: YYScreenUtil.setWidth(152),
    //   child:,
    // );
    // Widget userLevelprogress = Positioned(
    //   top: YYScreenUtil.setHeight(36),
    //   right: YYScreenUtil.setWidth(10),
    //   child:,
    // );
    Widget userRow = Positioned(
      top: YYScreenUtil.setHeight(36),
      right: YYScreenUtil.setWidth(10),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(AssetsUtil.index_path + "user_level.png"),
              Text(
                "1",
                style: TextStyle(
                    fontSize: YYScreenUtil.setSp(14),
                    color: Color(0xffC26B0C),
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
          Padding(
            padding: new EdgeInsets.only(right: YYScreenUtil.setWidth(4.5)),
          ),
          ProgressWidget(
            60,
            height: YYScreenUtil.setHeight(21.5),
            width: YYScreenUtil.setWidth(178.5),
            progressColor: Color(0xff3DD1F4),
            bgColor: Color.fromARGB(255, 46, 158, 204),
            borderColor: Color.fromARGB(255, 47, 139, 177),
          ),
        ],
      ),
    );
    print(YYScreenUtil.setWidth(375));
    return Stack(
      children: [
        bg,
        userHead,
        userRow,
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
