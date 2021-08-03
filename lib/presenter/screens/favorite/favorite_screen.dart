import 'package:demo_news/data/model/article_type.dart';
import 'package:demo_news/presenter/utils/language_ru.dart';
import 'package:demo_news/presenter/widgets/list_view/article_list_view.dart';
import 'package:demo_news/presenter/widgets/nav_bars/navigation_bar.dart';
import 'package:flutter/cupertino.dart';

class FavoriteNewsScreen extends StatelessWidget {
  const FavoriteNewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: DefaultNavigationBar(text: LanguageRu.labelFavorites),
      child: ArticleListView(
        type: ArticleType.favorites,
      ),
    );
  }
}
