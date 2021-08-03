import 'package:demo_news/api/local/dao/article_dao.dart';
import 'package:demo_news/api/remote/repository/article_repository.dart';
import 'package:demo_news/data/bloc/article_bloc.dart';
import 'package:demo_news/internal/app_module.dart';
import 'package:demo_news/presenter/screens/favorite/favorite_screen.dart';
import 'package:demo_news/presenter/screens/hot_news/hot_news_screen.dart';
import 'package:demo_news/presenter/utils/language_ru.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const List<BottomNavigationBarItem> tabItems = [
  BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.news_solid), label: LanguageRu.labelHotNews),
  BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.heart_fill), label: LanguageRu.labelFavorites),
];
final List<Widget> tabScreens = [
  BlocProvider<ArticleBloc>(
    create: (context) => ArticleBloc(
        repository: getIt<ArticleRepository>(),
        articleDao: getIt<ArticleDao>(),
        dio: getIt<Dio>()),
    child: HotNewsScreen(),
  ),
  BlocProvider<ArticleBloc>(
    create: (context) => ArticleBloc(
        repository: getIt<ArticleRepository>(),
        articleDao: getIt<ArticleDao>(),
        dio: getIt<Dio>()),
    child: FavoriteNewsScreen(),
  )
];
