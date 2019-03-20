import 'package:flutter/material.dart';

class TextDot extends StatefulWidget {
  final Widget child;

  TextDot({Key key, this.child}) : super(key: key);

  _TextDotState createState() => _TextDotState();
}

class _TextDotState extends State<TextDot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 3.0,
      height: 3.0,
      margin: EdgeInsets.symmetric(horizontal: 6.0),
      decoration: BoxDecoration(
        color: Color(0xffb2bac2),
        borderRadius: BorderRadius.all(Radius.circular(3.0))
      ),
    );
  }
}