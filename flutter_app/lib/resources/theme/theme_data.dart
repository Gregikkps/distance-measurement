import 'package:flutter/material.dart';
import 'package:distance_measurement_app/resources/theme/app_colors.dart';

class CustomThemeData {
  static final ThemeData themeData = ThemeData(
    useMaterial3: true,
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
