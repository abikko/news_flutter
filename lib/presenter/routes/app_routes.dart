import 'package:demo_news/presenter/screens/home_bottom_nav/home_with_bottom_bar_screen.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {
  static Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      default:
        return CupertinoPageRoute(
            builder: (context) => HomeBottomNavigationBarScreen());
    }
  }
}
