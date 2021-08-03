import 'package:demo_news/presenter/utils/color_utils.dart';
import 'package:flutter/cupertino.dart';

const CupertinoThemeData appTheme = CupertinoThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: ColorUtils.scaffoldBackgroundColor,
  textTheme: CupertinoTextThemeData(
    primaryColor: ColorUtils.defaultTextColor,
    textStyle: TextStyle(
      color: ColorUtils.defaultTextColor,
      fontWeight: FontWeight.w500,
    ),
  ),
);
