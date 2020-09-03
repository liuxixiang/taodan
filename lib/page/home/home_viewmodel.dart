import 'package:stacked/stacked.dart';
import 'package:taodan/common/apis/api_user.dart';
import 'package:taodan/model/user_entity.dart';
import 'package:taodan/utils/log_util.dart';

class HomeViewModel extends FutureViewModel<UserInfoEntity> {
  UserInfoEntity loginEntity;

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
    LogUtil.e('onData' + data.token);
  }

  @override
  Future initialise() {
    // TODO: implement initialise
    LogUtil.e('initialise====');
    return super.initialise();
  }

  @override
  Future<UserInfoEntity> futureToRun() async {
    // await UserAPI.login(
    //     'devops888', '18521701325', (data) => {loginEntity = data});
    // return loginEntity;
  }
}
