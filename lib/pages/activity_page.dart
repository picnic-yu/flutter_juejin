// 活动页面
import 'package:flutter/material.dart';
class ActivityPage extends StatefulWidget {
  final Widget child;

  ActivityPage({Key key, this.child}) : super(key: key);

  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('huodong'),
    );
  }
}