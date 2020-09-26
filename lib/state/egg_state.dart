import 'package:flutter/material.dart';
import 'package:taodan/common/apis/api_egg.dart';
import 'package:taodan/model/egg_entity.dart';

class EggState with ChangeNotifier {
  EggState() {
    _loadEggInfo();
  }
  int _percent = 0;
  // EggEntity
  EggEntity _eggEntity = EggEntity();
  int get percent => _percent;
  EggEntity get eggEntity => _eggEntity;

  _loadEggInfo() {
    EggApi.getEggInfo((data) => {setEggInfo(data)});
  }

  setEggInfo(EggEntity eggEntity) {
    if (eggEntity != null) {
      _eggEntity = eggEntity;
      _percent = _eggEntity.feedNeededForUpgrade > 0
          ? _eggEntity.feedSchedule * 100 ~/ _eggEntity.feedNeededForUpgrade
          : 0;
    }
    notifyListeners();
  }
}
