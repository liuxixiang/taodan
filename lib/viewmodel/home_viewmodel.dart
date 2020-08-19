import 'package:stacked/stacked.dart';
import 'package:taodan/api/api.dart';
import 'package:taodan/api/http_utils.dart';
import 'package:taodan/model/login_entity.dart';

class HomeViewModel extends BaseViewModel {
  LoginEntity loginEntity;

  request() {
    HttpUtils.instance.asyncRequestNetwork<LoginEntity>(
      Method.post,
      Api.LOGIN,
      params: {
        'code':'devops888',
        'mobile':'18521701325',
        'loginType':'mobile',
      },
      onSuccess: (code, msg, data) => {loginEntity = data},
    );
  }
}
