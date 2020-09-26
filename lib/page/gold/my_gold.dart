import 'package:flutter/material.dart';

class MyGoldPage extends StatelessWidget {
  const MyGoldPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new CustomScrollView(
        slivers: <Widget>[
          // new SliverAppBar(
          //   title: Text("我的金元宝"),
          //   expandedHeight: 230.0,
          //   floating: false,
          //   pinned: true,
          //   snap: false,
          // ),
          
          // ,
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: new SliverChildBuilderDelegate(
              (context, index) => new ListTile(
                title: new Text("Item $index"),
              ),
              childCount: 30,
            ),
          ),
        ],
      ),
    );
  }
}
