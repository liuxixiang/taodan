import 'dart:convert';

extension SHExtension on String {
  /// MD5加密
  // String getMD5() {
  //   var content = Utf8Encoder().convert(this);
  //   var digest = md5.convert(content);
  //   return digest.toString();
  // }

  // /// 判断是否是邮箱
  // bool isEmail() {
  //   return RegExp(regexEmail).hasMatch(this);
  // }

  /// string 转 int
  int toInt() {
    return int.parse(this);
  }

  /// string 转 double
  double toDouble() {
    return double.parse(this);
  }

  /// string 转bool
  // (字符串 不等于'true' 不大于0 等于空时 返回false 否则返回true)
  bool toBool() {
    if (this.toLowerCase() == "true" ||
        this.toInt() > 0 ||
        this.toDouble() > 0 ||
        this.trim() != '' ||
        this != '') {
      return true;
    }
    return false;
  }

  /// 编码
  String toCoding() {
    String str = this.toString();
    // 对字符串进行编码
    return jsonEncode(Utf8Encoder().convert(str));
  }

  /// 解码
  String toDeCoding() {
    var list = List<int>();

    // 字符串解码
    jsonDecode(this).forEach(list.add);
    String value = Utf8Decoder().convert(list);
    return value;
  }
}
