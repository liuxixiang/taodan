import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AmountTab extends StatefulWidget {
  @override
  _AmountTabState createState() => _AmountTabState();
}

class _AmountTabState extends State<AmountTab> {
  List<String> strs = ["昨日收益", "好友收益", "永久分红"];
  List<Widget> _createTitle() {
    List<Widget> widgets = [];
    for (var i = 0; i < strs.length; i++) {
      widgets.add(SizedBox(
        width: 118.w,
        height: 40.5.h,
        child: DecoratedBox(
            decoration: BoxDecoration(
                color: Color(0xffFF9B48),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8))),
            child: SizedBox(
              width: 106.w,
              height: 34.5.h,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Color(0xffFF9B48),
                    border: Border.all(
                        width: 1,
                        style: BorderStyle.solid,
                        color: Color(0xffFAF8E5)),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8))),
                child: Center(
                  child: Text(strs[i]),
                ),
              ),
            )),
      ));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Row(
            children: _createTitle(),
          )
        ],
      ),
    );
    // Stack(
    //   children: [
    //     Align(
    //       alignment: Alignment.topCenter,
    //       child: Row(
    //         children: _createTitle(),
    //       ),
    //     )
    //   ],
    // );
  }
}
