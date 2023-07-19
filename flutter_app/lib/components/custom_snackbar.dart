import 'package:flutter/material.dart';
import 'package:flutter_app/resources/theme/app_colors.dart';

class CustomSnackbar {
  static void showError(BuildContext context, String errorMessage) {
    final snackbar = SnackBar(
      content: ListTile(
        leading: const Icon(
          Icons.warning,
          color: AppColors.textColor,
        ),
        title: Text(
          errorMessage,
          style: const TextStyle(color: AppColors.textColor),
        ),
      ),
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 5),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
