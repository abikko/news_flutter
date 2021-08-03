import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_news/api/local/dao/article_dao.dart';
import 'package:demo_news/api/remote/repository/article_repository.dart';
import 'package:demo_news/data/model/article.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final ArticleDao articleDao;
  final ArticleRepository repository;
  final Dio dio;

  ArticleBloc(
      {required this.articleDao, required this.repository, required this.dio})
      : super(ArticleInitial());

  @override
  Stream<ArticleState> mapEventToState(
    ArticleEvent event,
  ) async* {
    if (event is ArticleLoadFavorites) {
      yield* articleDao.getFavorites();
    } else if (event is ArticleLoad) {
      yield* repository.getHotNews(dio);
    } else if (event is ArticleLiked) {
      articleDao.addFavoriteArticle(event.article);
    }
  }
}
