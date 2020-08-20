import 'package:common_info/common_info.dart';

class CommonUtils {
  static Future<String> getChannelName() async {
    return await CommonInfo.getMetaData("UMENG_CHANNEL");
  }
}
