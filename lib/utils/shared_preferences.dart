import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// 用来做shared_preferences的存储
class SpUtil {
  static SpUtil _instance;

  static SpUtil get instance {
    return getInstance();
  }

  static SharedPreferences _spf;

  SpUtil._();

  _init() async {
    _spf = await SharedPreferences.getInstance();
  }

  static SpUtil getInstance() {
    if (_instance == null) {
      _instance = new SpUtil._();
    }
    if (_spf == null) {
      _instance._init();
    }
    return _instance;
  }

  static _beforeCheck() async {
    if (_spf == null) {
      await _instance._init();
    }
  }

  // 判断是否存在数据
  Future<bool> hasKey(String key) async {
    Set keys = await getKeys();
    return keys.contains(key);
  }

  Future<Set<String>> getKeys() async {
    await _beforeCheck();
    return _spf.getKeys();
  }

  get(String key) async {
    await _beforeCheck();
    return _spf.get(key);
  }

  getString(String key) async {
    await _beforeCheck();
    return _spf.getString(key);
  }

  Future<bool> putString(String key, String value) async {
    await _beforeCheck();
    return _spf.setString(key, value);
  }

  Future<bool> getBool(String key) async {
    await _beforeCheck();
    return _spf.getBool(key);
  }

  Future<bool> putBool(String key, bool value) async {
    await _beforeCheck();
    return _spf.setBool(key, value);
  }

  Future<int> getInt(String key) async {
    await _beforeCheck();
    return _spf.getInt(key);
  }

  Future<bool> putInt(String key, int value) async {
    await _beforeCheck();
    return _spf.setInt(key, value);
  }

  Future<double> getDouble(String key) async {
    await _beforeCheck();
    return _spf.getDouble(key);
  }

  Future<bool> putDouble(String key, double value) async {
    await _beforeCheck();
    return _spf.setDouble(key, value);
  }

  Future<List<String>> getStringList(String key) async {
    await _beforeCheck();
    return _spf.getStringList(key);
  }

  Future<bool> putStringList(String key, List<String> value) async {
    await _beforeCheck();
    return _spf.setStringList(key, value);
  }

  dynamic getDynamic(String key) async {
    await _beforeCheck();
    return _spf.get(key);
  }

  Future<bool> remove(String key) async {
    await _beforeCheck();
    return _spf.remove(key);
  }

  Future<bool> clear() async {
    await _beforeCheck();
    return _spf.clear();
  }

  /// put object.
  Future<bool> putObject(String key, Object value) async {
    await _beforeCheck();
    return _spf.setString(key, value == null ? "" : json.encode(value));
  }

  /// get obj.
  Future<T> getObj<T>(String key, T f(Map v), {T defValue}) async {
    await _beforeCheck();
    Map map = await getObject(key);
    return map == null ? defValue : f(map);
  }

  /// get object.
  Future<Map> getObject(String key) async {
    await _beforeCheck();
    String _data = _spf.getString(key);
    return (_data == null || _data.isEmpty) ? null : json.decode(_data);
  }

  /// put object list.
  Future<bool> putObjectList(String key, List<Object> list) async {
    await _beforeCheck();
    List<String> _dataList = list?.map((value) {
      return json.encode(value);
    })?.toList();
    return _spf.setStringList(key, _dataList);
  }

  /// get obj list.
  Future<List<T>> getObjList<T>(String key, T f(Map v),
      {List<T> defValue = const []}) async {
    List<Map> dataList = await getObjectList(key);
    List<T> list = dataList?.map((value) {
      return f(value);
    })?.toList();
    return list ?? defValue;
  }

  /// get object list.
  Future<List<Map>> getObjectList(String key) async {
    await _beforeCheck();
    List<String> dataLis = _spf.getStringList(key);
    return dataLis?.map((value) {
      Map _dataMap = json.decode(value);
      return _dataMap;
    })?.toList();
  }
}
