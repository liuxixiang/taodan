import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taodan/utils/assets_util.dart';

class TaskBottomSheet extends StatefulWidget {
  @override
  _TaskBottomSheetState createState() => _TaskBottomSheetState();
}

class _TaskBottomSheetState extends State<TaskBottomSheet> {
  @override
  Widget build(BuildContext context) {
    List items = ["1", "2", "3"];
    return Container(
        width: 375.w,
        height: 600.h,
        child: Column(
          children: [
            Row(
              children: [
                Text("领取饲料"),
                Image.asset(AssetsUtil.common_path + "close_icon")
              ],
            ),
            SizedBox(
              height: max(items.length * 100, 300).toDouble(),
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return Container(
                      width: 345.w,
                      height: 90.h,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 254, 168, 34),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    );
                  }),
            )
          ],
        ));
  }
}
