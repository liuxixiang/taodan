import 'dart:math';

import 'package:flutter/material.dart';
import 'package:taodan/common/apis/api_egg.dart';
import 'package:taodan/model/egg_entity.dart';

class EggState with ChangeNotifier {
  EggState() {
    _loadEggInfo();
  }
  int _percent;
  // EggEntity
  EggEntity _eggEntity = new EggEntity();
  int get percent => _percent;
  EggEntity get eggEntity => _eggEntity;

  _loadEggInfo() {
    EggApi.getEggInfo((data) => {
          _eggEntity = data,
          _percent = _eggEntity.feedNeededForUpgrade > 0
              ? _eggEntity.feedSchedule * 100 ~/ _eggEntity.feedNeededForUpgrade
              : 0,
          notifyListeners()
        });
  }

  setEggInfo(EggEntity eggEntity) {
    _eggEntity = eggEntity;
    _percent = _eggEntity.feedNeededForUpgrade > 0
        ? _eggEntity.feedSchedule * 100 ~/ _eggEntity.feedNeededForUpgrade
        : 0;
    notifyListeners();
  }
}
