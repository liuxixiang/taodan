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
                              child: ImageWidget(
                                  url:
                                      "https://image.baidu.com/search/detail?ct=503316480&z=&tn=baiduimagedetail&ipn=d&word=%E5%91%A8%E6%9D%B0%E4%BC%A6&step_word=&ie=utf-8&in=&cl=2&lm=-1&st=-1&hd=&latest=&copyright=&cs=1435330949,2933798089&os=2384184854,1357207506&simid=3402406913,36805649&pn=3&rn=1&di=51700&ln=3080&fr=&fmq=1598579989826_R&ic=&s=undefined&se=&sme=&tab=0&width=&height=&face=undefined&is=0,0&istype=2&ist=&jit=&bdtype=0&spn=0&pi=0&gsm=0&objurl=http%3A%2F%2Fdingyue.nosdn.127.net%2F%3DkRx2zL89xdudUFs3Io16PUSRXuS3aNY2N8iRv6dZz01p1520858048237compressflag.jpg&rpstart=0&rpnum=0&adpicid=0&force=undefined"))
                        ],
                      ),
                    );
                  }),
            )
          ],
        ));
  }
}
