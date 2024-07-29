import 'package:e_commerce/product/theme/custom_color_scheme.dart';
import 'package:e_commerce/product/theme/custom_theme.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Custom light theme for project design
class CustomLightTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.lexend().fontFamily,
        colorScheme: CustomColorScheme.lightColorScheme,
        floatingActionButtonTheme: floatingActionButtonThemeData,
        textTheme: textTheme,
        bottomNavigationBarTheme: bottomNavigationBarThemeData,
      );

  @override
  FloatingActionButtonThemeData get floatingActionButtonThemeData =>
      const FloatingActionButtonThemeData();

  @override
  TextTheme get textTheme => TextTheme(
        displaySmall: GoogleFonts.rubik(
            color: ColorConstants.lightTextColor,
            fontSize: 36,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.4),
        displayMedium: GoogleFonts.rubik(
            color: ColorConstants.lightTextColor,
            fontSize: 48,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5),
        displayLarge: GoogleFonts.rubik(
            color: ColorConstants.lightTextColor,
            fontSize: 48,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.6),
        titleMedium: GoogleFonts.rubik(
            color: ColorConstants.lightTextColor,
            fontSize: 34.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.4),
        titleSmall: GoogleFonts.rubik(
            color: ColorConstants.lightTextColor,
            fontSize: 28,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.3),
        titleLarge: GoogleFonts.rubik(
            color: ColorConstants.lightTextColor,
            fontSize: 40,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.4),
        headlineSmall: GoogleFonts.rubik(
            color: ColorConstants.lightTextColor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.2),
        headlineMedium: GoogleFonts.rubik(
            color: ColorConstants.lightTextColor,
            fontSize: 24,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.3),
        headlineLarge: GoogleFonts.rubik(
            color: ColorConstants.lightTextColor,
            fontSize: 28,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.3),
        bodySmall: GoogleFonts.rubik(
            color: ColorConstants.lightTextColor,
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0),
        bodyMedium: GoogleFonts.rubik(
            color: ColorConstants.lightTextColor,
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0),
        bodyLarge: GoogleFonts.rubik(
            color: ColorConstants.lightTextColor,
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0),
        labelSmall: GoogleFonts.rubik(
            color: ColorConstants.lightTextColor,
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0),
        labelMedium: GoogleFonts.rubik(
            color: ColorConstants.lightTextColor,
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0),
        labelLarge: GoogleFonts.rubik(
            color: ColorConstants.lightTextColor,
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            letterSpacing: 0),
      );

  @override
  BottomNavigationBarThemeData get bottomNavigationBarThemeData =>
      BottomNavigationBarThemeData(
        backgroundColor: CustomColorScheme.lightColorScheme.background,
        selectedItemColor: CustomColorScheme.lightColorScheme.primary,
        unselectedItemColor: CustomColorScheme.lightColorScheme.secondary,
        selectedLabelStyle: textTheme.bodyMedium,
        unselectedLabelStyle: textTheme.bodyMedium,
      );
}
