import 'package:demo_news/presenter/utils/color_utils.dart';
import 'package:flutter/cupertino.dart';

class DefaultNavigationBar extends StatelessWidget
    implements ObstructingPreferredSizeWidget {
  final String text;

  const DefaultNavigationBar({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      middle: Text(
        text,
        style: TextStyle(
          color: ColorUtils.defaultTextColor,
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => CupertinoNavigationBar().preferredSize;

  @override
  bool shouldFullyObstruct(BuildContext context) =>
      CupertinoNavigationBar().shouldFullyObstruct(context);
}
