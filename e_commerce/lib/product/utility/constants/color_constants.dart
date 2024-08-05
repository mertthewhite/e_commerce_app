import 'package:e_commerce/product/theme/custom_color_scheme.dart';
import 'package:flutter/material.dart';

@immutable
class ColorConstants {
  const ColorConstants._();
  static Color greyBackgroundColor =
      CustomColorScheme.lightColorScheme.background;
  static Color whiteColor = Colors.white;
  static Color orangeColor = CustomColorScheme.lightColorScheme.primary;
  static Color deepBlueColor = CustomColorScheme.lightColorScheme.secondary;
  static Color greyColor = CustomColorScheme.lightColorScheme.outline;
  static Color onPrimary = CustomColorScheme.lightColorScheme.onPrimary;

  //target colors
  static const lightTextColor = Color(0xFF181725);
  static const blueColor = Color.fromRGBO(77, 172, 246, 1);
  static const cyanColor = Color.fromRGBO(36, 235, 221, 1);
  static const purpleColor = Color.fromRGBO(135, 123, 236, 1);
  static const greyyColor = Color.fromRGBO(82, 83, 85, 1);
  static const redColor = Color.fromRGBO(252, 81, 70, 1);
  static const navyBlueColor = Color.fromRGBO(0, 56, 255, 1);
  static const cyanGreenColor = Color.fromRGBO(182, 246, 77, 1);
  static const orangeeColor = Color.fromRGBO(255, 153, 0, 1);
  static const deepPurpleColor = Color.fromRGBO(177, 13, 255, 1);
  static const pinkColor = Color.fromRGBO(253, 34, 139, 1);
  static const turkuazColor = Color.fromRGBO(25, 194, 164, 1);
  static const blackColor = Color.fromRGBO(0, 0, 1, 1);
  static const lightGreyColorDivider = Color(0xffE0E0E0);
  static const lightGreenColor = Color(0xff53B175);
  static const lightGreyColor = Color(0xFF7C7C7C);
  static const containerBackground = Color(0xFFF2F3F2);
  static const borderGreyColor = Color(0xFFE2E2E2);

  // static Color onPrimary = ProductStateItems.appRouter.router.routerDelegate.navigatorKey.currentContext!.theme.primaryColor;
}
