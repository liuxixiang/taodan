import 'package:taodan/api/http_utils.dart';
import 'package:taodan/model/login_entity.dart';

import 'api_path.dart';

/// 用户
class UserAPI {
  login() async {
    HttpUtils.instance.requestNetwork(
      Method.post,
      ApiPath.LOGIN,
      params: {
        'code': 'devops888',
        'mobile': '18521701325',
        'loginType': 'mobile',
      },
      onSuccess: (code, msg, data) => {LoginEntity.fromJson(data)},
    );
  }
}
