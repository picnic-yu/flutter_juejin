import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/article_detail.dart';
import '../pages/swip_page.dart';
import '../pages/page_for_web.dart';
// handle就是对于路由的处理函数 
// handlerFunc里面的params就是我们的url的查询参数
Handler articleDetailHandler = Handler(
  handlerFunc: (
    BuildContext context, Map<String, List<String>> params) {
      String articleId = params['id']?.first;
      String title = params['title']?.first;
      print('index>,articleDetail id is $articleId');
      return ArticleDetail(articleId, title);
    }
);

Handler swipPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String pics = params['pics']?.first;
  String index = params['currentIndex']?.first;
  print(pics);
  return SwipPage(pics: pics,currentIndex: index,);
});

Handler webPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String articleUrl = params['url']?.first;
  String title = params['title']?.first;
  print('$articleUrl and  $title');
  return PageForWeb(articleUrl, title);
});