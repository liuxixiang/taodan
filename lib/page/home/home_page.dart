import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taodan/common/apis/api_common.dart';
import 'package:taodan/common/apis/api_egg.dart';
import 'package:taodan/common/widgets/progress_widget.dart';
import 'package:taodan/common/widgets/task_bottom_sheet.dart';
import 'package:taodan/page/home/index/egg_widget.dart';
import 'package:taodan/router/navigator_util.dart';
import 'package:taodan/state/commons.dart';
import 'package:taodan/utils/assets_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomeScreen> {
  List<Widget> widgets = [];
  List<String> imgs = ["get_food", "feed", "feeder", "guide"];
  BuildContext context;
  EggWidget eggWidget;
  void _clickBottomImage(int i) {
    switch (i) {
      case 0:
        showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (BuildContext context) {
              return ChangeNotifierProvider(
                create: (_) => CommonState(),
                child: TaskBottomSheet(),
              );
            });
        break;
      case 1:
        //todo 喂养
        EggApi.feedChick((data) => {eggWidget.feed(data)});
        break;
      case 2:
        //todo 饲养员
        NavigatorUtil.goMyBreeder(context);
        break;
      case 3:
        // NavigatorUtil.goTest(context);
        NavigatorUtil.goTest(context);
        // CommonApi.getGame((data) => {NavigatorUtil.goWebView(context, data)});
        //todo 玩法引导
        break;
      default:
    }
  }

  Widget bg = Expanded(
      child: Image.asset(
    AssetsUtil.index.index_bg,
    width: 375.w,
    height: 618.h,
    fit: BoxFit.cover,
  ));
  Widget chicken = Positioned(
    left: 29.w,
    top: 300.5.h,
    child: Image.asset(AssetsUtil.index.index_chicken),
  );
  Widget feeder = Positioned(
    right: 57.w,
    top: 279.h,
    child: Image.asset(
      AssetsUtil.index.people,
      height: 120.h,
    ),
  );
  Widget goldEgg = Positioned(
      left: 118.5.w,
      top: 452.h,
      child: Column(
        children: [
          Image.asset(
            AssetsUtil.index.gold_egg,
            height: 56.h,
          ),
          ProgressWidget(80),
        ],
      ));

  Widget todayReward = Positioned(
      top: 90.5.h,
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 241, 154, 48),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(26.5),
              bottomRight: Radius.circular(26.5)),
        ),
        padding: EdgeInsets.fromLTRB(17.5.w, 6.h, 15.5.w, 5.h),
        child: Column(
          children: [
            Text("今日分红收益",
                style: TextStyle(color: Colors.white, fontSize: 13.sp)),
            Text("¥" + 180.toString(),
                style: TextStyle(color: Colors.white, fontSize: 15.sp))
          ],
        ),
      ));
  Widget userHead = Positioned(
    top: 35.h,
    left: 15.w,
    child: Stack(
      fit: StackFit.loose,
      overflow: Overflow.visible,
      alignment: Alignment.centerLeft,
      children: [
        Positioned(
          left: 35.w / 2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: Color(0x28127EB3),
              width: 101.5.w,
              height: 35.h,
              child: Center(
                child: Text(
                  "用户姓名",
                  style: TextStyle(fontSize: 13.sp, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        Image.asset(
          AssetsUtil.index.head_icon,
          width: 35.w,
          height: 35.w,
        ),
      ],
    ),
  );
  Widget userRow = Positioned(
    top: 36.h,
    right: 10.w,
    child: Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AssetsUtil.index.user_level),
            Text(
              "1",
              style: TextStyle(
                  fontSize: 14.sp,
                  color: Color(0xffC26B0C),
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
        Padding(
          padding: new EdgeInsets.only(right: 4.5.w),
        ),
        ProgressWidget(
          60,
          height: 21.5.h,
          width: 178.5.w,
          progressColor: Color(0xff3DD1F4),
          bgColor: Color.fromARGB(255, 46, 158, 204),
          borderColor: Color.fromARGB(255, 47, 139, 177),
        ),
      ],
    ),
  );

  @override
  void initState() {
    imgs = ["get_food", "feed", "feeder", "guide"];
    for (var i = 0; i < imgs.length; i++) {
      widgets.add(GestureDetector(
        onTap: () {
          _clickBottomImage(i);
        },
        child: Image.asset(Index.index_path + imgs[i] + ".png"),
      ));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    eggWidget = EggWidget();
    return Stack(
      children: [
        bg,
        userHead,
        userRow,
        todayReward,
        chicken,
        feeder,
        eggWidget,
        goldEgg,
        Positioned(
          width: 375.w,
          bottom: 14.9.h,
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
