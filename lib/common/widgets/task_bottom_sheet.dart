import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:taodan/common/apis/api_task.dart';
import 'package:taodan/model/config/config_100100.dart';
import 'package:taodan/router/navigator_util.dart';
import 'package:taodan/state/commons.dart';
import 'package:taodan/state/user_state.dart';
import 'package:taodan/utils/assets_util.dart';

class TaskBottomSheet extends StatelessWidget {
  List<Config100100> items = [];

  Widget build(BuildContext context) {
    items = context.watch<CommonState>().items;
    return Container(
        width: 375.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(26.5), topLeft: Radius.circular(26.5)),
        ),
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            SizedBox(
              height: 21.5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("领取饲料"),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset(
                    AssetsUtil.common.close_icon,
                    width: 16.5.w,
                    height: 16.5.h,
                  ),
                )
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 11.h)),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
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
                          child: GestureDetector(
                            onTap: () => _goTaskWall(context, items[index]),
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
                                  items[index].btnTitle,
                                  style: TextStyle(fontSize: 13.sp),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            top: 17.5.h,
                            left: 16.5.w,
                            child: Image.network(
                              items[index].icon,
                              width: 55.w,
                              height: 55.h,
                            )),
                        Positioned(
                            top: 18.h,
                            left: 88.5.w,
                            width: 151.5.w,
                            child: Text(
                              items[index].title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 13.sp),
                            )),
                        Positioned(
                            top: 60.h,
                            left: 88.5.w,
                            child: Text(
                              items[index].desc,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Color(0xffFFEED3), fontSize: 12.sp),
                            ))
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    new Divider(
                  color: Colors.transparent,
                  height: 10.h,
                ),
              ),
            ),
          ],
        ));
  }

  _goTaskWall(BuildContext context, Config100100 taskType) {
    NavigatorUtil.goTaskWall(context, taskType.url);
    TaskAPI.checkTask(taskType.taskId,
        context.read<UserState>().userInfo.userId, (data) => {});
    TaskAPI.saveUserTask(taskType.taskId,
        context.read<UserState>().userInfo.userId, (data) => {});
    // Navigator.of(context).push(
    //   PageRouteBuilder(

    //     opaque: false, // set to false
    //     pageBuilder: (_, __, ___) => TaskWallPage(),
    //   ),
    // );
  }
}
