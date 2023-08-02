import 'package:distance_measurement_app/resources/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:distance_measurement_app/resources/theme/app_colors.dart';

class CustomThemeData {
  static final ThemeData lightThemeData = _buildLightThemeData();
  static final ThemeData darkThemeData = _buildDarkThemeData();

  static ThemeData _buildLightThemeData() {
    final ThemeData lightThemeData = ThemeData.light();
    final TextThemeExtension customTextTheme = TextThemeExtension();

    return lightThemeData.copyWith(
      useMaterial3: true,
      colorScheme: ColorScheme.light(
        primary: AppColors().primaryLightColor,
        secondary: AppColors().secondaryLightColor,
      ),
      appBarTheme: AppBarTheme(
        titleTextStyle: lightThemeData.textTheme.titleLarge,
      ),
      extensions: <ThemeExtension<dynamic>>[customTextTheme],
    );
  }

  static ThemeData _buildDarkThemeData() {
    final ThemeData darkThemeData = ThemeData.dark();
    final TextThemeExtension customTextTheme = TextThemeExtension();

    return darkThemeData.copyWith(
      useMaterial3: true,
      colorScheme: ColorScheme.dark(
        primary: AppColors().primaryDarkColor,
        secondary: AppColors().secondaryDarkColor,
      ),
      appBarTheme: AppBarTheme(
        titleTextStyle: darkThemeData.textTheme.titleLarge,
      ),
      extensions: <ThemeExtension<dynamic>>[customTextTheme],
    );
  }
}
