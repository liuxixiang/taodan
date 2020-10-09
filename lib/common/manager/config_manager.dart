import 'dart:collection';

import 'package:taodan/common/apis/api_config.dart';
import 'package:taodan/common/config/remote_config.dart';
import 'package:taodan/model/config/base_config_entity.dart';
import 'package:taodan/model/config/config_100100.dart';

class ConfigManager {
  Map<String, BaseConfigEntity> _configs = HashMap();

  ConfigManager._();

  factory ConfigManager.getInstance() => _instance;
  static final _instance = ConfigManager._();

  Future<BaseConfigEntity> getConfig(String code) async {
    if (_configs != null && _configs.containsKey(code)) {
      return _configs[code];
    } else {
      return await _loadConfig(code);
    }
  }

  Future<List<T>> getConfigParamList<T>(String code) async {
    BaseConfigEntity configEntity = await getConfig(code);
    return configEntity.paramValue;
  }

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
}
