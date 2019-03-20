// 页面总入口
import 'package:flutter/material.dart';
import './index_page.dart';
import './pins_page.dart';
import './book_page.dart';
import './respos_page.dart';
import './activity_page.dart';

class MyApp extends StatefulWidget {
  final Widget child;

  MyApp({Key key, this.child}) : super(key: key);

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  final TextStyle tabTextStyleNormal =
        TextStyle(color: const Color(0xffdddddd));
  final TextStyle tabTextStyleSelected =
        TextStyle(color: const Color(0xff4d91fd));
  // 底部bar
  final List<Tab> _bottomTabs = <Tab>[
    Tab(
      text: '首页',
      icon: Icon(Icons.home),
    ),
    Tab(
      text: '沸点',
      icon: Icon(Icons.chat),
    ),
    Tab(
      text: '小册',
      icon: Icon(Icons.book),
    ),
    Tab(
      text: '开源库',
      icon: Icon(Icons.bubble_chart),
    ),
    Tab(
      text: '活动',
      icon: Icon(Icons.local_activity),
    ),
  ];
  TabController _tabController;
  
  @override
  void initState() {
    super.initState();
    _tabController =
        new TabController(vsync: this, length: _bottomTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blue
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Title'),
          ),
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[
              IndexPage(),
              PinsPage(),
              BookPage(),
              ReposPage(),
              ActivityPage()
            ],
          ),
          bottomNavigationBar: Material(
            color: Theme.of(context).primaryColor,
            child: TabBar(
              tabs:_bottomTabs,
              controller: _tabController,
              indicatorColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}