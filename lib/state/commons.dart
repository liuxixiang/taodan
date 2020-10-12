import 'package:flutter/material.dart';
import 'package:taodan/common/config/remote_config.dart';
import 'package:taodan/common/manager/config_manager.dart';
import 'package:taodan/model/config/config_100100.dart';

class CommonState with ChangeNotifier {
  List<Config100100> items = [];

  CommonState() {
    loadTaskWall();
//    ConfigManager.getInstance()
//        .loadConfigs(
//        [RemoteConfigCode.config_100100, RemoteConfigCode.config_100101]);
  }

  Future<List<Config100100>> loadTaskWall() async {
    items = await ConfigManager.getInstance()
        .getConfigParamList(RemoteConfigCode.config_100100);
    notifyListeners();
    return items;
  }
}
