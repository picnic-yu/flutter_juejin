// 小册页面
import 'package:flutter/material.dart';
class BookPage extends StatefulWidget {
  final Widget child;

  BookPage({Key key, this.child}) : super(key: key);

  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 3,
      child: new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: new TabBar(
            tabs: <Widget>[
              new Tab(
                child: Column(
                  children: <Widget>[
                    Icon(Icons.directions_car),
                    Text('car')
                  ],
                ),
              ),
              Tab(
                child: Column(
                  children: <Widget>[
                    Icon(Icons.directions_transit),
                    Text('transit')
                  ],
                ),
              ),
              Tab(
                child: Column(
                  children: <Widget>[
                    Icon(Icons.directions_bike),
                    Text('bike')
                  ],
                ),
              )
            ],
            indicatorColor: Colors.white,
          )
        ),
        body: TabBarView(
          children: <Widget>[
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}