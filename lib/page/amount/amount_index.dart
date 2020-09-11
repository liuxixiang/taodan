import 'package:flutter/material.dart';
import 'package:taodan/common/widgets/pic_text_button.dart';
import 'package:taodan/page/amount/amount_tab.dart';
import 'package:taodan/utils/assets_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AmountIndex extends StatefulWidget {
  @override
  _AmountIndexState createState() => _AmountIndexState();
}

class _AmountIndexState extends State<AmountIndex> {
  _createTable() {
    var list = [
      "普通分红收益：15,000元",
      "加成分红收益：15,000元",
      "分红用户人数：1,000人",
      "人均分红收益：187.43元",
      "永久分红人数：2人",
      "人均永久分红：199元"
    ];
    List<Widget> listRow = [];
    for (var i = 0; i < list.length; i = i + 2) {
      List<Widget> listItem = [];
      listItem.add(Padding(padding: EdgeInsets.only(left: 17.5.w)));
      listItem.add(SizedBox(
        width: 144.w,
        child: Text(
          list[i],
          style: itemStyle,
        ),
      ));
      listItem.add(Padding(padding: EdgeInsets.only(left: 35.5.w)));
      // listItem.add(Padding(padding: EdgeInsets.only(left: 196.5.w)));
      listItem.add(Text(list[i + 1], style: itemStyle));
      var row = Row(
        children: listItem,
      );
      listRow.add(Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: row,
      ));
    }
    return listRow;
  }

  TextStyle itemStyle = TextStyle(
      fontSize: 13.sp,
      color: Color(0xff783D11),
      decoration: TextDecoration.none);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff783D11),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                AssetsUtil.amount.title,
                width: 308.w,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.5.h),
            ),
            Container(
              height: 194.5.w,
              width: 360.w,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage(AssetsUtil.amount.title_bg),
                    fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "平台收益",
                      style: TextStyle(fontSize: 18.5.sp, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 19.5.h),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "187,430元",
                        style: TextStyle(
                            color: Color(0xff333330), fontSize: 21.sp),
                      ),
                    ),
                  ),
                  Column(
                    children: _createTable(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 18.5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  PicTextButton(
                    Text(
                      "查看我的分红",
                      style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    ),
                    AssetsUtil.amount.button_red,
                    () => {},
                    150,
                  ),
                  PicTextButton(
                      Text(
                        "喂鸡蛋赚分红",
                        style: TextStyle(color: Colors.white, fontSize: 16.sp),
                      ),
                      AssetsUtil.amount.button_orange,
                      () => {},
                      150),
                  // Expanded(
                  // child: DefaultTabController(
                  //   length: 2,
                  //   child: Scaffold(
                  //     appBar: AppBar(
                  //       title: Text("wendjia"),
                  //       bottom: TabBar(
                  //         tabs: [
                  //           Tab(
                  //             text: "汽车",
                  //           ),
                  //           Tab(text: "测试")
                  //         ],
                  //       ),
                  //     ),
                  //     body:
                  //         TabBarView(children: [Text("test"), Text("data")]),
                  //   ),
                  // ),
                  // )
                ],
              ),
            ),
            AmountTab()
          ],
        ),
      ),
    );
  }
}
