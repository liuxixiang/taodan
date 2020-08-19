import 'dart:async';

import 'package:flutter/services.dart';

class Common {
  static const MethodChannel _channel = const MethodChannel('common');

  static Future<String> get channelName async {
    final String version = await _channel.invokeMethod('getChannelName');
    return version;
  }
}
