import 'package:stacked/stacked.dart';
import 'package:taodan/api/http_utils.dart';
import 'package:taodan/common/apis/api_path.dart';
import 'package:taodan/model/login_entity.dart';

class HomeViewModel extends BaseViewModel {
  LoginEntity loginEntity;

  request() {
    HttpUtils.instance.asyncRequestNetwork(
      Method.post,
      ApiPath.LOGIN,
      params: {
        'code': 'devops888',
        'mobile': '18521701325',
        'loginType': 'mobile',
      },
      onSuccess: (code, msg, data) => {
        loginEntity = LoginEntity.fromJson(data)
      },
    );
  }
}
