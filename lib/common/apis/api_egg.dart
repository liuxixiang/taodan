import 'package:flutter/material.dart';
import 'package:taodan/api/http_utils.dart';
import 'package:taodan/common/manager/context_manager.dart';
import 'package:taodan/model/egg_entity.dart';
import 'package:provider/provider.dart';
import 'package:taodan/state/user_state.dart';
import 'api_path.dart';
import 'apis.dart';

class EggApi {
  static getEggInfo(OnNetSuccess<EggEntity> onNetSuccess) async {
    await HttpUtils.instance.requestNetwork(Method.get, ApiPath.member.eggInfo,
        queryParameters: {
          "userId": ContextManager.context.read<UserState>().userInfo.userId
        }, onSuccess: (code, msg, data) {
      onNetSuccess.call(EggEntity.fromJson(data));
    });
  }

  static feedChick(OnNetSuccess<EggEntity> onNetSuccess) async {
    await HttpUtils.instance
        .requestNetwork(Method.post, ApiPath.member.feedChick,
            // params: {'code': code},
            params: {
          "theEggFeedWasProduced": 100,
          "userId": ContextManager.context.read<UserState>().userInfo.userId
        }, onSuccess: (code, msg, data) {
      onNetSuccess.call(EggEntity.fromJson(data));
      // onNetSuccess.call();
      // onNetSuccess.call(LoginEntity.fromJson(data));
    });
  }
}
