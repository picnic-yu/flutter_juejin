import 'package:flutter/material.dart';
import '../model/index_cell.dart';
import './text_dot.dart';
import './goodAndCommentCell.dart';

import '../routers/application.dart';
import 'dart:core';
class IndexListCell extends StatelessWidget {
  final IndexCell cellInfo;
  final TextStyle titleTextStyle = TextStyle(
    color: Color(0xFFB2BAC2),
    fontWeight: FontWeight.w300,
    fontSize: 13.0,
  );
  IndexListCell({Key key,this.cellInfo}):super(key : key);
  List<Widget> _buildFirstRow() {
      List<Widget> _listRow = new List();
      if (cellInfo.hot) {
        _listRow.add(Text(
          '热',
          style: TextStyle(
            color: Color(0xFFF53040),
            fontWeight: FontWeight.w600,
          ),
        ));
        _listRow.add(TextDot());
      }
      if (cellInfo.isCollection == 'post') {
        _listRow.add(Text(
          '专栏',
          style: TextStyle(
            color: Color(0xFFBC30DA),
            fontWeight: FontWeight.w600,
          ),
        ));
        _listRow.add(TextDot());
      }
      _listRow.add(Text(cellInfo.username, style: titleTextStyle));
      _listRow.add(TextDot());
      _listRow.add(Text(cellInfo.createdTime, style: titleTextStyle));
      _listRow.add(TextDot());
      _listRow.add(Expanded(
        //防止文本超长
        child: Text(
          cellInfo.tag,
          style: titleTextStyle,
          overflow: TextOverflow.ellipsis,
        ),
      ));
      return _listRow;
    }
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
        print('跳转到详情页');
        Application.router.navigateTo(context, "/detail?id=${Uri.encodeComponent(cellInfo.detailUrl)}&title=${Uri.encodeComponent(cellInfo.title)}");
      },
      child:Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 20.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: _buildFirstRow(),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 9.0),
              child: Text(
                cellInfo.title,
                style:TextStyle(
                  color:Color(0xFF393C3F),
                  fontSize:14.0,
                  fontWeight: FontWeight.w600
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            GoodAndCommentCell(cellInfo.collectionCount, cellInfo.commentCount),
            SizedBox(
              height: 15.0,
            ),
            Divider(
              height: 2.0,
            )
          ],
        ),
      )
    ); 
  }
}