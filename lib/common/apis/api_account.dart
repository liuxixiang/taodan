import 'package:taodan/api/http_utils.dart';
import 'package:taodan/model/account_info_entity.dart';

import 'api_path.dart';
import 'apis.dart';

class AccountAPI {
  static queryAccountInfo(OnNetSuccess<AccountInfoEntity> onNetSuccess) {
    HttpUtils.instance.requestNetwork(
      Method.get,
      ApiPath.account.queryAccountHome,
      onSuccess: (code, msg, data) {
        if (onNetSuccess != null) {
          onNetSuccess(AccountInfoEntity.fromJson(data));
        }
      },
    );
  }
}
