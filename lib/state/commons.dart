import 'package:flutter/material.dart';

import 'package:taodan/common/apis/api_config.dart';
import 'package:taodan/common/config/remote_config.dart';
import 'package:taodan/model/task_type.dart';

class CommonState with ChangeNotifier {
  List<TaskType> items = [];

  CommonState() {
    loadTaskWall();
  }
  // List<TaskType> get items => _items ?? loadTaskWall();

  List<TaskType> loadTaskWall() {
    // CommonApi.getGame((data) => {print("wendjia:" + data)});
    ConfigApi.getConfig(RemoteConfig.code.task_wall,
        (data) => {items = data, notifyListeners()});
  }
}
