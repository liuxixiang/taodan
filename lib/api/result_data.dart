import 'package:taodan/common/config/keys.dart';
import 'package:taodan/utils/json_util.dart';

/// 网络结果数据
class ResultData {
  int code;
  String message;
  var data;

  ResultData(this.code, this.message, this.data);

  ResultData.fromJson(Map<String, dynamic> json) {
    code = json['code'] as int;
    message = json['message'] as String;
    if (json.containsKey('data')) {
      data = json['data'];
    }
  }

//  T _generateOBJ<T>(Object json) {
//    if (T.toString() == 'String') {
//      return json.toString() as T;
//    } else if (T.toString() == 'Map<dynamic, dynamic>') {
//      return json as T;
//    } else {
//      /// List类型数据由fromJsonAsT判断处理
//      return JsonConvert.fromJsonAsT(json);
//    }
//  }
}
