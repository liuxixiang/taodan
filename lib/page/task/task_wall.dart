import 'package:flutter/material.dart';

class TaskWallPage extends StatefulWidget {
  @override
  _TaskWallPageState createState() => _TaskWallPageState();
}

class _TaskWallPageState extends State<TaskWallPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: EdgeInsets.only(top: 30),
        child: Text("wendjia test"),
      ),
    );
  }
}
