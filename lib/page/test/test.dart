import 'package:flutter/material.dart';
import 'package:taodan/page/amount/amount_index.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AmountIndex(),
    );
  }
}
