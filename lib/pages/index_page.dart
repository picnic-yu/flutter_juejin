// 首页
import 'package:flutter/material.dart';
import '../util/dataUtils.dart';
import '../widgets/index_list_cell.dart';
import '../widgets/indexListHeader.dart';
class IndexPage extends StatefulWidget {
  final Widget child;

  IndexPage({Key key, this.child}) : super(key: key);

  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  List _listData = [];
  _renderList(context , index){
    if(index == 0){
      return IndexListHeader(false);
    }
    return  IndexListCell(cellInfo: _listData[index-1]);
  }
  getList(bool isLoadMore) {
    DataUtils.getIndexListData().then((resultList) {
      setState(() {
        _listData = resultList;
      });
    });
  }
  @override
  void initState() {
    super.initState();
    getList(false);
  }
  @override
  Widget build(BuildContext context) {
   if (_listData.length == 0) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return ListView.builder(
      itemCount: _listData.length+1,//添加一个header
      itemBuilder: (context,index)=> _renderList(context,index),
    );
  }
}