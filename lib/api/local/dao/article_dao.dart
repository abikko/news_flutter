import 'package:demo_news/api/local/hive_constraints.dart';
import 'package:demo_news/data/bloc/article_bloc.dart';
import 'package:demo_news/data/model/article.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ArticleDao {
  Stream<ArticleState> getFavorites() async* {
    yield ArticleLoading();
    final Box favoritesBox = Hive.box(HiveConstraints.favoritesBox);
    List<Article>? favoriteList = (favoritesBox
                .get(HiveConstraints.favoritesKey, defaultValue: <Article>[])
            as List<Article>)
        .cast<Article>();
    yield ArticleLoaded(articles: favoriteList);
  }

  void addFavoriteArticle(Article article) {
    final Box favoritesBox = Hive.box(HiveConstraints.favoritesBox);
    final List<Article> articleList = favoritesBox
        .get(HiveConstraints.favoritesKey, defaultValue: <Article>[]);
    articleList.add(article);
    favoritesBox.put(HiveConstraints.favoritesKey, articleList);
  }
}
