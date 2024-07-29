import 'package:flutter/material.dart';

abstract class CustomTheme {
  ThemeData get themeData;

  FloatingActionButtonThemeData get floatingActionButtonThemeData;

  TextTheme get textTheme;

  BottomNavigationBarThemeData get bottomNavigationBarThemeData;
}
