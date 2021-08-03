part of 'article_bloc.dart';

@immutable
abstract class ArticleState {}

class ArticleInitial extends ArticleState {}

class ArticleLoading extends ArticleState {}

class ArticleLoaded extends ArticleState {
  final List<Article> articles;

  ArticleLoaded({required this.articles});
}

class ArticleFailure extends ArticleState {
  final String message;

  ArticleFailure({required this.message});
}
