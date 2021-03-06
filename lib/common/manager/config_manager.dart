import 'dart:collection';

import 'package:flutter/services.dart';
import 'package:taodan/common/apis/api_config.dart';
import 'package:taodan/common/apis/apis.dart';
import 'package:taodan/common/config/remote_config.dart';
import 'package:taodan/model/config/base_config_entity.dart';
import 'package:taodan/model/config/config_100100.dart';

class ConfigManager {
  Map<String, BaseConfigEntity> _configs = HashMap();

  ConfigManager._();

  factory ConfigManager.getInstance() => _instance;
  static final _instance = ConfigManager._();

  ///单个
  Future<BaseConfigEntity> getConfig(String code) async {
    if (_configs != null && _configs.containsKey(code)) {
      return _configs[code];
    } else {
      return await _loadConfig(code);
    }
  }

  ///单个云控返回list
  Future<List<T>> getConfigParamList<T>(String code) async {
    BaseConfigEntity configEntity = await getConfig(code);
    return configEntity.paramValue;
  }

  ///多个云控
  loadConfigs(List<String> codes) async {
    if (codes == null || codes.isEmpty) {
      return;
    }
    await ConfigApi.getConfigs(codes.join(','), (data) {
      if (data != null && data is Map) {
        _transform(data);
      }
    });
    return _configs;
  }

  Future<BaseConfigEntity> _loadConfig(String code) async {
    await loadConfigs([code]);
    return _configs[code];
  }

  ///转换
  _transform(Map<String, dynamic> configMap) {
    if (configMap != null && configMap.isNotEmpty) {
      configMap.forEach((key, value) {
        BaseConfigEntity configEntity = BaseConfigEntity.fromJson(value);
        if (configEntity != null && configEntity.paramValue != null) {
          dynamic config;
          switch (key) {
            case RemoteConfigCode.config_100100:
              config = Config100100.fromJsonList(configEntity.paramValue);
              break;
            case RemoteConfigCode.config_100101:
              break;
          }
          if (config != null) {
            configEntity.paramValue = config;
            _configs[key] = configEntity;
          }
        }
      });
    }
  }

  ///批量新增云控
  batchInsertUpdate(String json, OnNetSuccess<String> onNetSuccess) async {
    await ConfigApi.batchInsertUpdate(json, onNetSuccess);
  }

  batchInsertUpdateConfig(String fileName) {
    //访问json代码.
    rootBundle.loadString(fileName).then(
          (value) async => {
            await ConfigManager.getInstance()
                .batchInsertUpdate(value, (data) {})
          },
        );
  }

  ///新增云控
  insertConfig(String json, OnNetSuccess<String> onNetSuccess) async {
    await ConfigApi.insertConfig(json, onNetSuccess);
  }
}
