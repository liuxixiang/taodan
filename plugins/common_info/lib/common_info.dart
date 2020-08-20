import 'dart:async';

import 'package:flutter/services.dart';

class CommonInfo {
  static const MethodChannel _channel = const MethodChannel('common_info');

  static Future<String> getMetaData(String key) async {
    final String metaData = await _channel.invokeMethod('getMetaData', key);
    return metaData;
  }
}
