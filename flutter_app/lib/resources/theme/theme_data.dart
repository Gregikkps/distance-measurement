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
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: AppColors().primaryLightColor,
      ),
      appBarTheme: AppBarTheme(
        titleTextStyle: lightThemeData.textTheme.titleLarge,
      ),
      primaryColor: AppColors().primaryLightColor,
      snackBarTheme: const SnackBarThemeData(
        contentTextStyle: TextStyle(
          color: AppColors.whiteColor,
        ),
      ),
      extensions: <ThemeExtension<dynamic>>[customTextTheme],
    );
  }

  static ThemeData _buildDarkThemeData() {
    final ThemeData darkThemeData = ThemeData.dark();
    final TextThemeExtension customTextTheme = TextThemeExtension();

    return darkThemeData.copyWith(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: AppColors().primaryDarkColor,
      ),
      appBarTheme: AppBarTheme(
        titleTextStyle: darkThemeData.textTheme.titleLarge,
      ),
      primaryColor: AppColors().primaryDarkColor,
      snackBarTheme: const SnackBarThemeData(
        contentTextStyle: TextStyle(
          color: AppColors.whiteColor,
        ),
      ),
      extensions: <ThemeExtension<dynamic>>[customTextTheme],
    );
  }
}
