import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtils {
  static showToast(
    @required String msg,
    Toast toastLength,
    ToastGravity gravity,
  ) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: toastLength,
        gravity: gravity,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static showCenterToast(
    @required String msg,
  ) {
    showToast(
      msg,
      Toast.LENGTH_LONG,
      ToastGravity.CENTER,
    );
  }

  static showBottomToast(
    @required String msg,
  ) {
    showToast(
      msg,
      Toast.LENGTH_LONG,
      ToastGravity.BOTTOM,
    );
  }
}
