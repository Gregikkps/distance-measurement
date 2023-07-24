import 'package:distance_measurement_app/resources/app_config.dart';
import 'package:distance_measurement_app/resources/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSnackbar {
  static void showError(BuildContext context, String errorMessage) {
    final snackbar = SnackBar(
      content: ListTile(
        leading: const Icon(
          Icons.warning,
          color: AppColors.whiteTextColor,
        ),
        title: Text(
          errorMessage,
          style: const TextStyle(
            color: AppColors.whiteTextColor,
          ),
        ),
      ),
      backgroundColor: AppColors.errorRed,
      duration: AppConfig.snakcbarDuration,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
