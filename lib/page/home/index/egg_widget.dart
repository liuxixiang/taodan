import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taodan/common/widgets/progress_widget.dart';
import 'package:taodan/model/egg_entity.dart';
import 'package:taodan/state/egg_state.dart';
import 'package:taodan/utils/assets_util.dart';
import 'package:provider/provider.dart';

class EggWidget extends StatefulWidget {
  EggWidget({Key key}) : super(key: key);
  _EggWidgetState state = _EggWidgetState();
  feed(EggEntity eggEntity) {
    state.updateEggInfo(eggEntity);
  }

  @override
  _EggWidgetState createState() => state;
}

class _EggWidgetState extends State<EggWidget> {
  BuildContext _context;
  EggState eggState = new EggState();

  updateEggInfo(EggEntity eggEntity) {
    print(_context);
    Provider.of<EggState>(_context, listen: false).setEggInfo(eggEntity);
  }

  @override
  Widget build(BuildContext context) {
    this._context = context;
    print("wendjia" + _context.toString());
    return ChangeNotifierProvider(
      create: (_) => eggState,
      builder: (context, child) => Positioned(
        left: 25.2.w,
        top: 452.h,
        child: Column(
          children: [
            Image.asset(
              AssetsUtil.index.egg,
              height: 56.h,
            ),
            ProgressWidget(context.watch<EggState>().percent),
          ],
        ),
      ),
    );
  }
}
