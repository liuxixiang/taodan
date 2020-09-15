import 'package:taodan/api/http_utils.dart';
import 'package:taodan/model/login_entity.dart';

import 'api_path.dart';
import 'apis.dart';

class AccountAPI {
  static queryAccountInfo(OnNetSuccess<LoginEntity> onNetSuccess) {
    HttpUtils.instance.requestNetwork(
      Method.post,
      ApiPath.account.queryAccountHome,
      onSuccess: (code, msg, data) {
        if (onNetSuccess != null) {
          onNetSuccess(LoginEntity.fromJson(data));
        }
      },
    );
  }
}
