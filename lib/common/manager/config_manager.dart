import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:taodan/common/apis/api_config.dart';
import 'package:taodan/common/config/remote_config.dart';
import 'package:taodan/model/config/config_100100.dart';

class ConfigManager {
  Map<String, dynamic> _configs = HashMap();

  ConfigManager._();

  factory ConfigManager.getInstance() => _instance;
  static final _instance = ConfigManager._();

  Future<List<T>> getConfig<T>(String code) async {
    if (_configs != null && _configs.containsKey(code)) {
      return _configs[code];
    } else {
      return await loadConfig<T>(code);
    }
  }

  Future<List<T>> loadConfig<T>(String code) async {
    List<T> config = List();
    await ConfigApi.getConfig(code, (data) {
      if (data != null && data is List) {
        switch (code) {
          case RemoteConfigCode.config_100100:
            config = Config100100.fromJsonList(data).cast<T>();
            break;
          case RemoteConfigCode.config_100101:
            break;
        }
      }
    });
    if (config.isNotEmpty) {
      _configs[code] = config;
    }
    return config;
  }
}
