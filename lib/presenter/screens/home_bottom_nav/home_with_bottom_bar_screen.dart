import 'package:demo_news/presenter/utils/tab_screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeBottomNavigationBarScreen extends StatefulWidget {
  const HomeBottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  _HomeBottomNavigationBarScreenState createState() =>
      _HomeBottomNavigationBarScreenState();
}

class _HomeBottomNavigationBarScreenState
    extends State<HomeBottomNavigationBarScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBuilder: (context, index) => tabScreens[index],
      tabBar: CupertinoTabBar(
        items: tabItems,
      ),
    );
  }
}
