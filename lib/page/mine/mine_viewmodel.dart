import 'package:stacked/stacked.dart';
import 'package:taodan/common/apis/api_user.dart';
import 'package:taodan/common/manager/user_manager.dart';
import 'package:taodan/model/login_entity.dart';
import 'package:taodan/model/user_info_entity.dart';
import 'package:taodan/utils/log_util.dart';

class MineViewModel extends FutureViewModel<UserInfoEntity> {
  @override
  Future<UserInfoEntity> futureToRun() async {
     await UserAPI.findUser(
             (data) => {});
//     return loginEntity;
  }

}
