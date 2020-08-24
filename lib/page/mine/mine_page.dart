import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: new BoxDecoration(
              color: Colors.red,
            ),
          ),
          Icon(Icons.import_contacts)
        ],
      ),
    );
  }
}
