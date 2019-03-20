// 首页
import 'package:flutter/material.dart';
import '../util/dataUtils.dart';
import '../widgets/index_list_cell.dart';
import '../widgets/indexListHeader.dart';
import '../constants/constants.dart';

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
  final pageIndexArray = Constants.RANK_BEFORE;
  Map<String, dynamic> _params = {"src": 'web', "category": "all", "limit": 20};
  int _pageIndex = 0;
  getList(bool isLoadMore) {
    if(!isLoadMore){
      // reload的时候重置page
      _pageIndex = 0;
    }
    _params['before'] = pageIndexArray[_pageIndex];

    DataUtils.getIndexListData(_params).then((result) {
     setState(() {
        _listData = result;
      });
    });
  }

  // 下拉刷新
  Future<void> _onRefresh() async{//The RefreshIndicator onRefresh callback must return a Future.
    _listData.clear();
    setState(() {
      _listData = _listData;
      //注意这里需要重置一切请求条件
    });
    getList(false);
    return null;
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
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.builder(
        itemCount: _listData.length + 2, //添加一个header 和 loadMore
        itemBuilder: (context, index) => _renderList(context, index),
      ),
    );
  }
}