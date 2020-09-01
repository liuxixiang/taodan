import 'package:taodan/api/http_utils.dart';
import 'package:taodan/common/apis/apis.dart';
import 'package:taodan/model/login_entity.dart';

import 'api_path.dart';

/// 用户
class UserAPI {
  static login(String code, String mobile,
      OnNetSuccess<LoginEntity> onNetSuccess) async {
    await HttpUtils.instance.requestNetwork(
      Method.post,
      ApiPath.LOGIN,
      params: {
        'appId': "taodan",
        'createdBy': code,
        'loginNo': mobile,
        'loginType': 'app',
      },
      onSuccess: (code, msg, data) {
        onNetSuccess.call(LoginEntity.fromJson(data));
      },
    );
  }
}
