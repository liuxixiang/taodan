import 'package:taodan/config/keys.dart';
import 'package:taodan/utils/json_util.dart';

/// 网络结果数据
class ResultData<T> {
  int code;
  String message;
  T data;

  ResultData(this.code, this.message, this.data);

  ResultData.fromJson(Map<String, dynamic> json) {
    code = json[Keys.CODE] as int;
    message = json[Keys.MESSAGE] as String;
    if (json.containsKey(Keys.DATA)) {
      data = _generateOBJ<T>(json[Keys.DATA]);
    }
  }

  T _generateOBJ<T>(Object json) {
    if (T.toString() == 'String') {
      return json.toString() as T;
    } else if (T.toString() == 'Map<dynamic, dynamic>') {
      return json as T;
    } else {
      /// List类型数据由fromJsonAsT判断处理
//      return JsonUtil.getObjList(source, (v) => null)<T>(json);
    }
  }
}
