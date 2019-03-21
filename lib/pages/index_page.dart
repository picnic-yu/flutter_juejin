// 首页
import 'package:flutter/material.dart';
import 'dart:core';
import '../util/dataUtils.dart';
import '../widgets/index_list_cell.dart';
import '../widgets/indexListHeader.dart';
import '../constants/constants.dart';
import '../model/index_cell.dart';
import '../widgets/load_more.dart';

class IndexPage extends StatefulWidget {
  final Widget child;

  IndexPage({Key key, this.child}) : super(key: key);

  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  List <IndexCell> _listData = [];
  bool _isRequesting = false; //是否正在请求数据的flag
  bool _hasMore = true;
  ScrollController _scrollController = new ScrollController();//监听滚动   ListView.builder中有一个属性为Controller，他可以监听页面的滚动
  _renderList(context , index){
    if(index == 0){
      return IndexListHeader(false);
    }
    if (index == _listData.length + 1) {
      return LoadMore(_hasMore);
    }
    return  IndexListCell(cellInfo: _listData[index-1]);
  }
  final pageIndexArray = Constants.RANK_BEFORE;
  Map<String, dynamic> _params = {"src": 'web', "category": "all", "limit": 20};
  int _pageIndex = 0;
  getList(bool isLoadMore) {
    if (_isRequesting || !_hasMore) return;
    if (!isLoadMore) {
      // reload的时候重置page
      _pageIndex = 0;
    }
    _params['before'] = pageIndexArray[_pageIndex];
    _isRequesting = true;
    print('-----------------------------------------------------------------------------------------------------------------------------------------------------------------------');
    DataUtils.getIndexListData(_params).then((result) {
      _pageIndex += 1;
      List <IndexCell> resultList = new List();
      if(isLoadMore){
        resultList.addAll(_listData);
      }
      resultList.addAll(result);
      setState(() {
        _listData = resultList;
        _hasMore = _pageIndex < pageIndexArray.length;
        _isRequesting = false;
      });
    });
  }

  // 下拉刷新
  Future<void> _onRefresh() async{//The RefreshIndicator onRefresh callback must return a Future.
    _listData.clear();
    setState(() {
      _listData = _listData;
      //注意这里需要重置一切请求条件
      _hasMore = true;
    });
    getList(false);
    return null;
  }
  @override
  void initState() {
    super.initState();
    getList(false);
    // 页面初始化，滚动监听，并且触发getlist请求
    _scrollController.addListener(() {
      if (_scrollController.offset  ==
          _scrollController.position.maxScrollExtent) {
            print('loadMore');
        getList(true);
      }
    });
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
        controller: _scrollController,
      ),
    );
  }
}