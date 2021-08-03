part of 'article_bloc.dart';

@immutable
abstract class ArticleEvent {}

class ArticleLiked extends ArticleEvent {
  final Article article;

  ArticleLiked({required this.article});
}

class ArticleLoad extends ArticleEvent {}

class ArticleLoadFavorites extends ArticleEvent {}
