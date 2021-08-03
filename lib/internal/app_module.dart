import 'package:demo_news/api/local/dao/article_dao.dart';
import 'package:demo_news/api/remote/repository/article_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.I;

initGetIt() {
  getIt.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/v2/',
        connectTimeout: 15000,
      ),
    ),
  );

  getIt.registerLazySingleton<ArticleRepository>(() => ArticleRepository());

  getIt.registerLazySingleton<ArticleDao>(() => ArticleDao());
}
