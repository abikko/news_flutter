import 'package:demo_news/data/model/article_type.dart';
import 'package:demo_news/presenter/utils/language_ru.dart';
import 'package:demo_news/presenter/widgets/list_view/article_list_view.dart';
import 'package:demo_news/presenter/widgets/nav_bars/navigation_bar.dart';
import 'package:flutter/cupertino.dart';

class HotNewsScreen extends StatefulWidget {
  const HotNewsScreen({Key? key}) : super(key: key);

  @override
  _HotNewsScreenState createState() => _HotNewsScreenState();
}

class _HotNewsScreenState extends State<HotNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: DefaultNavigationBar(text: LanguageRu.labelHotNews),
      child: ArticleListView(
        type: ArticleType.hot,
      ),
    );
  }
}
