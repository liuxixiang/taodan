import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:taodan/page/breeder/my_breeder_viewmodel.dart';

class MyBreederPage extends StatefulWidget {
  @override
  _MyBreederPageState createState() => _MyBreederPageState();
}

class _MyBreederPageState extends State<MyBreederPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController; //需要定义一个Controller
  final List<Tab> _myTabs = <Tab>[
    Tab(
      text: '雇佣',
//      icon: Icon(Icons.add_shopping_cart),
    ),
    Tab(
      text: '雇佣中',
//      icon: Icon(Icons.wifi_tethering),
    ),
    Tab(
      text: '已过期',
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
          bottom: TabBar(
            controller: _tabController,
            tabs: _myTabs,
          ),
        ),
        body: ViewModelBuilder<MyBreederViewModel>.reactive(
          builder: (context, model, child) => _buildInputForm(),
          viewModelBuilder: () => MyBreederViewModel(),
        ));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // 登录表单
  Widget _buildInputForm() {
    return TabBarView(
        controller: _tabController,
        children: _myTabs.map((Tab tab) {
          return Center(child: Text(tab.text));
        }).toList());
  }
}
