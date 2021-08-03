import 'dart:developer';

import 'package:demo_news/api/remote/http_constraints.dart';
import 'package:demo_news/data/bloc/article_bloc.dart';
import 'package:demo_news/data/model/article.dart';
import 'package:dio/dio.dart';

class ArticleRepository {
  Stream<ArticleState> getHotNews(Dio dio) async* {
    yield ArticleLoading();
    try {
      Response response = await dio.get(
        "/top-headlines",
        queryParameters: {
          'country': "us",
          'apiKey': HttpConstraints.API_KEY,
        },
      );
      List<Article> articleList = (response.data['articles'] as List)
          .map((e) => Article.fromJson(e))
          .toList();
      yield ArticleLoaded(articles: articleList);
    } on DioError catch (e) {
      log(e.message);
      yield ArticleFailure(message: e.message);
    }
  }
}
