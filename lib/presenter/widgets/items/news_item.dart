import 'package:demo_news/data/model/article.dart';
import 'package:demo_news/presenter/utils/color_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  final Article hotNews;
  final bool isFavorite;
  final Function onPressed;

  const NewsItem(
      {Key? key,
      required this.hotNews,
      required this.isFavorite,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12.0),
      shadowColor: Colors.black,
      elevation: 16.0,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 6.0),
        child: Column(
          children: [
            Image.network(
              hotNews.urlToImage ?? "",
              height: 100.0,
              width: double.maxFinite,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 8.0),
            Text(hotNews.title ?? "No title",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0)),
            Row(
              children: [
                Flexible(
                  child: Text(
                    hotNews.description ?? "No desc",
                    style: TextStyle(),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    isFavorite
                        ? CupertinoIcons.heart_fill
                        : CupertinoIcons.heart,
                    color: isFavorite
                        ? ColorUtils.favoriteHeartColor
                        : ColorUtils.unFavoriteHeartColor,
                    size: 30.0,
                  ),
                  onPressed: () => onPressed(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
