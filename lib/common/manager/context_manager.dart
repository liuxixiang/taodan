import 'package:flutter/cupertino.dart';

class ContextManager {
  static GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentState.context;
}
