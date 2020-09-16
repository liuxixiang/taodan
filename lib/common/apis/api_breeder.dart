import 'package:flutter/cupertino.dart';
import 'package:taodan/api/http_utils.dart';
import 'package:taodan/model/login_entity.dart';

import 'api_path.dart';
import 'apis.dart';

class BreederApi {
  ///B 雇佣    Y   雇佣中     N    已过期
  static findBreederInfo(
      {int page = 1,
      @required String type,
      int pageSize = 10,
      OnNetSuccess<LoginEntity> onNetSuccess}) {
    HttpUtils.instance.requestNetwork(
      Method.get,
      ApiPath.member.findBreederInfo,
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
        'type': type,
      },
      onSuccess: (code, msg, data) {
        if (onNetSuccess != null) {
          onNetSuccess(LoginEntity.fromJson(data));
        }
      },
    );
  }
}