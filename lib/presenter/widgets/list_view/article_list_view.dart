import 'package:demo_news/data/bloc/article_bloc.dart';
import 'package:demo_news/data/model/article_type.dart';
import 'package:demo_news/presenter/utils/language_ru.dart';
import 'package:demo_news/presenter/widgets/items/news_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticleListView extends StatefulWidget {
  final ArticleType type;

  const ArticleListView({Key? key, required this.type}) : super(key: key);

  @override
  _ArticleListViewState createState() => _ArticleListViewState();
}

class _ArticleListViewState extends State<ArticleListView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleBloc, ArticleState>(
      builder: (context, state) {
        if (state is ArticleLoaded) {
          return SafeArea(
            child: ListView.separated(
              itemBuilder: (context, index) => NewsItem(
                hotNews: state.articles[index],
                isFavorite: false,
                onPressed: () => {
                  context
                      .read<ArticleBloc>()
                      .add(ArticleLiked(article: state.articles[index]))
                },
              ),
              separatorBuilder: (context, int) => SizedBox(height: 12.0),
              itemCount: state.articles.length,
            ),
          );
        } else if (state is ArticleLoading) {
          return Center(
            child: CupertinoActivityIndicator(),
          );
        } else if (state is ArticleFailure) {
          String text = "default";
          switch (widget.type) {
            case ArticleType.hot:
              {
                text = LanguageRu.textTryLater;
                break;
              }
            case ArticleType.favorites:
              {
                text = LanguageRu.textFavoriteEmpty;
                break;
              }
          }
          return Center(
            child: Text(text),
          );
        } else {
          switch (widget.type) {
            case ArticleType.favorites:
              {
                context.read<ArticleBloc>().add(ArticleLoadFavorites());
                break;
              }
            case ArticleType.hot:
              {
                context.read<ArticleBloc>().add(ArticleLoad());
                break;
              }
          }
          return Center(
            child: Text(
              LanguageRu.textTryLater,
            ),
          );
        }
      },
    );
  }
}
