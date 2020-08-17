import 'package:flutter/material.dart';
import 'package:taodan/api/http_utils.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text("normal"),
        onPressed: () {
          _request();
        },
      ),
    );
  }

  _request() {
    HttpUtils.instance.asyncRequestNetwork(Method.get, "");
  }
}
