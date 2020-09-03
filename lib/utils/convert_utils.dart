import 'dart:collection';

class ConvertUtils {
  ///将map转换成url
  static String map2url(Map<String, dynamic> map) {
    if (map == null) {
      return "";
    }
    StringBuffer sb = StringBuffer();
    map.forEach((key, value) {
      sb..write(key + '=' + value + '')..write('&');
    });
    String s = sb.toString();
    if (s.endsWith("&")) {
      s = s.substring(0, s.length - 1);
    }
    return s;
  }

  ///将url参数转换成map
  static Map<String, Object> getUrlParams(String param) {
    Map<String, dynamic> map = HashMap();
    if (param.isEmpty) {
      return map;
    }
    List<String> params = param.split("&");
    params.forEach((element) {
      List<String> p = element.split("=");
      if (p.length == 2) {
        map[p[0]] = p[1];
      }
    });
    return map;
  }
}
