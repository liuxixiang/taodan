import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taodan/common/widgets/progress_widget.dart';
import 'package:taodan/model/egg_entity.dart';
import 'package:taodan/state/egg_state.dart';
import 'package:taodan/utils/assets_util.dart';

class EggWidget extends StatefulWidget {
  EggWidget({Key key}) : super(key: key);
  _EggWidgetState state;
  feed(EggEntity eggEntity) {
    state.updateEggInfo(eggEntity);
  }

  @override
  _EggWidgetState createState() {
    state = _EggWidgetState();
    return state;
  }
}

class _EggWidgetState extends State<EggWidget> {
  EggState eggState;

  updateEggInfo(EggEntity eggEntity) {
    // print(_context);
    eggState.setEggInfo(eggEntity);
  }

  @override
  void initState() {
    super.initState();
    eggState = EggState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => eggState,
      child: Positioned(
        left: 25.2.w,
        top: 452.h,
        child: Consumer<EggState>(
          builder: (context, value, child) {
            return Column(children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Image.asset(
                    AssetsUtil.index.egg,
                    height: 56.h,
                  ),
                  Center(
                    child: Text(
                      "${value.eggEntity.userEggTotal ?? ""}",
                      style: TextStyle(color: Colors.white, fontSize: 11.sp),
                    ),
                  )
                ],
              ),
              ProgressWidget(value.percent),
            ]);
          },
          // builder: (context, child) => ,
        ),
      ),
    );
  }
}
