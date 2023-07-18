import 'package:flutter/material.dart';
import 'package:flutter_app/resources/theme/app_colors.dart';

class CustomThemeData {
  static final ThemeData themeData = ThemeData(
    primaryColor: AppColors.primaryColor,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 16.0,
        fontFamily: 'Roboto',
      ),
    ),
  );
}
