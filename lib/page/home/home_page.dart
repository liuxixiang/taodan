import 'package:flutter/material.dart';
import 'package:taodan/common/widgets/progress_widget.dart';
import 'package:taodan/page/home/task_bottom_sheet.dart';
import 'package:taodan/router/navigator_util.dart';
import 'package:taodan/utils/assets_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

void _clickBottomImage(BuildContext context, int i) {
  switch (i) {
    case 0:
      showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return TaskBottomSheet();
          });
      break;
    case 1:
      //todo 喂养
      break;
    case 2:
      //todo 饲养员
      NavigatorUtil.goMyBreeder(context);
      break;
    case 3:
      //todo 玩法引导
      break;
    default:
  }
}

class _State extends State<HomeScreen> {
  List<Widget> widgets = [];
  List<String> imgs = ["get_food", "feed", "feeder", "guide"];
  @override
  void initState() {
    imgs = ["get_food", "feed", "feeder", "guide"];
    for (var i = 0; i < imgs.length; i++) {
      // widgets.add(new Expanded(flex: 1, child: new Text("wendjia")));
      widgets.add(GestureDetector(
        onTap: () {
          _clickBottomImage(context, i);
        },
        child: Image.asset(Index.index_path + imgs[i] + ".png"),
      ));
    }
    super.initState();
  }

  Widget bg = Image.asset(
    AssetsUtil.index.index_bg,
    width: 375.w,
    fit: BoxFit.cover,
  );
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
  Widget egg = Positioned(
    left: 25.2.w,
    top: 452.h,
    child: Column(
      children: [
        Image.asset(
          AssetsUtil.index.egg,
          height: 56.h,
        ),
        ProgressWidget(80),
      ],
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
  @override
  Widget build(BuildContext context) {
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

    return Stack(
      children: [
        bg,
        userHead,
        userRow,
        todayReward,
        chicken,
        feeder,
        egg,
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
