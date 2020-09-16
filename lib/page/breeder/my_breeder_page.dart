import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:taodan/common/config/tab_name.dart';
import 'package:taodan/common/values/colors.dart';
import 'package:taodan/page/breeder/my_breeder_viewmodel.dart';

import 'my_breeder_list_widget.dart';

class MyBreederPage extends StatefulWidget {
  @override
  _MyBreederPageState createState() => _MyBreederPageState();
}

class _MyBreederPageState extends State<MyBreederPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController; //需要定义一个Controller
  final List page = [];
  final List<Tab> _myTabs = <Tab>[
    Tab(
      text: TabName.tabEmploy,
//      icon: Icon(Icons.add_shopping_cart),
    ),
    Tab(
      text: TabName.tabEmploying,
//      icon: Icon(Icons.wifi_tethering),
    ),
    Tab(
      text: TabName.tabEmployed,
//      icon: Icon(Icons.airline_seat_flat_angled),
    )
  ];

  @override
  void initState() {
    // 创建Controller
    _tabController = TabController(length: _myTabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('我的饲养员'),
        ),
        body: ViewModelBuilder<MyBreederViewModel>.reactive(
          builder: (context, model, child) => _buildTabBar(),
          viewModelBuilder: () => MyBreederViewModel(),
        ));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  //
  Widget _buildTabBar() {
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: TabBar(
            indicatorColor: AppColors.yellow,
            controller: _tabController,
            tabs: _myTabs,
            labelColor: AppColors.black_33,
            unselectedLabelColor: AppColors.gray_99,
          ),
        ),
        Expanded(
          child: TabBarView(
              controller: _tabController,
              children: _myTabs.map((Tab tab) {
                return Center(child: MyBreederListWidget(tab.text));
              }).toList()),
        ),
      ],
    );
  }
}
