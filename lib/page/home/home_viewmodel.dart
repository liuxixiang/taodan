import 'package:stacked/stacked.dart';
import 'package:taodan/common/apis/api_user.dart';
import 'package:taodan/model/login_entity.dart';
import 'package:taodan/utils/log_util.dart';

class HomeViewModel extends FutureViewModel<LoginEntity> {
  LoginEntity loginEntity;

  @override
  void onError(error) {
    // TODO: implement onError
    super.onError(error);
    LogUtil.e('onError');
  }

  @override
  void onData(data) {
    // TODO: implement onData
    super.onData(data);
    LogUtil.e('onData' + data.auth);
  }

  @override
  Future initialise() {
    // TODO: implement initialise
    LogUtil.e('initialise====');
    return super.initialise();
  }

  @override
  Future<LoginEntity> futureToRun() async {
    await UserAPI.login(
        'devops888', '18521701325', (data) => {loginEntity = data});
    return loginEntity;
  }
}
