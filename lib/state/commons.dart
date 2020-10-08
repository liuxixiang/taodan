import 'package:flutter/material.dart';
import 'package:taodan/common/config/remote_config.dart';
import 'package:taodan/common/manager/config_manager.dart';
import 'package:taodan/model/config/config_100100.dart';

class CommonState with ChangeNotifier {
  List<Config100100> items = [];

  CommonState() {
    loadTaskWall();
  }

  Future<List<Config100100>> loadTaskWall() async {
    items = await ConfigManager.getInstance()
        .getConfig(RemoteConfigCode.config_100100);
    notifyListeners();
    return items;
  }
}
