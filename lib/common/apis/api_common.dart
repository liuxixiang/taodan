import 'dart:convert';

import 'package:taodan/api/http_utils.dart';
import 'package:taodan/common/apis/api_path.dart';
import 'package:taodan/common/apis/apis.dart';

class CommonApi {
  static getGame<T>(OnNetSuccess<T> onNetSuccess) async {
    await HttpUtils.instance.requestNetwork(
      Method.get,
      ApiPath.common.game,
      onSuccess: (code, msg, data) {
        // Map<String, dynamic> map = json.decode(data);
        onNetSuccess.call(data["data"]);
      },
    );
  }
}
