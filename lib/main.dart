import 'package:demo_news/data/model/source.dart';
import 'package:demo_news/internal/app_module.dart';
import 'package:demo_news/presenter/routes/app_routes.dart';
import 'package:demo_news/presenter/utils/AppTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'api/local/hive_constraints.dart';
import 'data/model/article.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(HiveConstraints.favoritesBox);
  Hive.registerAdapter(ArticleAdapter());
  Hive.registerAdapter(SourceAdapter());
  initGetIt();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      onGenerateRoute: (routeSettings) =>
          AppRoutes.generateRoute(routeSettings),
      title: 'News application',
      theme: appTheme,
    );
  }
}
