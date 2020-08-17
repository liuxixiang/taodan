
import 'package:flutter/material.dart';
import 'package:taodan/api/api.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    HttpManager().netFetch(url, params, header, option)
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
