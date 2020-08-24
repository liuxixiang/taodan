import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:taodan/page/main/main_viewmodel.dart';
import 'package:taodan/page/navigation/bottom_navigation_widget.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => MainViewModel(),
      onModelReady: (model) => {
//         model.request()
      },
      builder: (context, model, child) => Scaffold(
        bottomNavigationBar: new BottomNavigationWidget(),
      ),
    );
  }
}
