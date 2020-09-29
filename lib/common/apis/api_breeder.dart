import 'package:flutter/cupertino.dart';
import 'package:taodan/api/http_utils.dart';
import 'package:taodan/model/breeder_entity.dart';
import 'package:taodan/model/check_exchange_breeder_entity.dart';
import 'package:taodan/model/login_entity.dart';

import 'api_path.dart';
import 'apis.dart';

class BreederApi {
  ///B 雇佣    Y   雇佣中     N    已过期
  static findBreederInfo(
      {int page = 1,
      @required String type,
      int pageSize = 10,
      OnNetSuccess<List<BreederInfoEntity>> onNetSuccess}) async {
    await HttpUtils.instance.requestNetwork(
      Method.get,
      ApiPath.member.findBreederInfo,
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
        'type': type,
      },
      onSuccess: (code, msg, data) {
        if (onNetSuccess != null) {
          onNetSuccess(BreederEntity.fromJson(data).result);
        }
      },
    );
  }

  ///B 雇佣    Y   雇佣中     N    已过期
  static checkExchangeBreeder(String type,
      OnNetSuccess<CheckExchangeBreederEntity> onNetSuccess) async {
    await HttpUtils.instance.requestNetwork(
      Method.get,
      ApiPath.member.exchangeBreeder,
      queryParameters: {
        'breederType': type,
      },
      onSuccess: (code, msg, data) {
        if (onNetSuccess != null) {
          onNetSuccess(CheckExchangeBreederEntity.fromJson(data));
        }
      },
    );
  }

  ///B 雇佣    Y   雇佣中     N    已过期
  static addBreederInfo(String type,
      OnNetSuccess<CheckExchangeBreederEntity> onNetSuccess) async {
    await HttpUtils.instance.requestNetwork(
      Method.get,
      ApiPath.member.addBreederInfo,
      params: {
        'breederType': type,
      },
      onSuccess: (code, msg, data) {
        if (onNetSuccess != null) {
          onNetSuccess(CheckExchangeBreederEntity.fromJson(data));
        }
      },
    );
  }
}
