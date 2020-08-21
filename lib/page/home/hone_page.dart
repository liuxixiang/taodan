import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:taodan/common/widgets/bottom_navigatiton_widget.dart';
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
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => {model.request()},
      builder: (context, model, child) => Scaffold(
        bottomNavigationBar: new BottomNavigationWidget(),
        body: Center(
          child: Text(""),
        ),
      ),
    );
  }
}
