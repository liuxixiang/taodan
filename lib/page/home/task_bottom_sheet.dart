import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taodan/common/widgets/image_widget.dart';
import 'package:taodan/model/task_type.dart';
import 'package:taodan/utils/assets_util.dart';

class TaskBottomSheet extends StatefulWidget {
  @override
  _TaskBottomSheetState createState() => _TaskBottomSheetState();
}

class _TaskBottomSheetState extends State<TaskBottomSheet> {
  @override
  Widget build(BuildContext context) {
    List<TaskType> items = [
      TaskType()..buttonText = "去完成",
      TaskType()..buttonText = "去完成",
      TaskType()..buttonText = "去完成"
    ];
    return Container(
        width: 375.w,
        height: 600.h,
        margin: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            Row(
              children: [
                Text("领取饲料"),
                Image.asset(
                  AssetsUtil.common.close_icon,
                  width: 16.5.w,
                  height: 16.5.h,
                )
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
                      child: Stack(
                        children: [
                          Positioned(
                            top: 35.h,
                            right: 19.5.w,
                            child: Container(
                              width: 72.5.w,
                              height: 25.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Center(
                                child: Text(
                                  items[index].buttonText,
                                  style: TextStyle(fontSize: 13.sp),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                              top: 17.5.h,
                              left: 16.5.w,
                              child: Image.asset(
                                AssetsUtil.test.test,
                                width: 55.w,
                                height: 55.h,
                              )),
                          Positioned(
                              top: 18.h,
                              left: 88.5.w,
                              width: 151.5.w,
                              child: Text(
                                "每日签到+1G～28G饲料 连续签到，奖励更多每日签到+1G～28G饲料 连续签到，奖励更多",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13.sp),
                              )),
                          Positioned(
                              top: 60.h,
                              left: 88.5.w,
                              child: Text(
                                "每天限1份",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Color(0xffFFEED3), fontSize: 12.sp),
                              ))
                        ],
                      ),
                    );
                  }),
            )
          ],
        ));
  }
}
