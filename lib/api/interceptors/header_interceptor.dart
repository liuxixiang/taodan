import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:dio/dio.dart';
import 'package:package_info/package_info.dart';
import 'package:taodan/common/config/keys.dart';
import 'package:taodan/utils/common_utils.dart';

/// header拦截器
class HeaderInterceptor extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    options.headers[Keys.APP_ID] = "joy";
    options.headers[Keys.APP_NAME] = packageInfo.appName;
    options.headers[Keys.APP_VERSION_KEY] = packageInfo.version;
    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      options.headers[Keys.APP_OS_KEY] = 'ios';
      options.headers[Keys.APP_CHANNEL_KEY] = 'appstore';
      options.headers[Keys.DEVICE_ID_KEY] = iosInfo.identifierForVendor;
    } else if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      options.headers[Keys.APP_OS_KEY] = 'android';
      options.headers[Keys.APP_CHANNEL_KEY] = await CommonUtils.getChannelName();
      options.headers[Keys.DEVICE_ID_KEY] = androidInfo.device;
    }
    return options;
  }
}
