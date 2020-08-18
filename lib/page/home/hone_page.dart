import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:taodan/api/http_utils.dart';
import 'package:taodan/viewmodel/home_viewmodel.dart';

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
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Text(model.title),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }

  _request() {
    HttpUtils.instance.asyncRequestNetwork(Method.get, "");
  }
}
