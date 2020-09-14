import 'package:taodan/api/http_utils.dart';
import 'package:taodan/model/task_check_entity.dart';

import 'api_path.dart';
import 'apis.dart';

class TaskAPI {
  static getConfigs<T>(String taskId, OnNetSuccess<T> onNetSuccess) async {
    await HttpUtils.instance.requestNetwork(
      Method.get,
      ApiPath.member.checkTask,
      queryParameters: {
        'taskId': taskId,
      },
      // params: {
      // 'taskId': code,
      //   'mobile': mobile,
      //   'loginType': 'mobile',
      // },
      onSuccess: (code, msg, data) {
        onNetSuccess.call(TaskCheckEntity.fromJson(data));
      },
    );
  }
}
