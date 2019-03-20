import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/article_detail.dart';
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