import 'package:distance_measurement_app/resources/tools/platform_mode_checker.dart';
import 'package:flutter/material.dart';
import 'package:distance_measurement_app/resources/app_spacing/app_spacing.dart';
import 'package:distance_measurement_app/resources/theme/app_colors.dart';

class CustomCard extends StatelessWidget {
  final Widget child;

  const CustomCard({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.transparent,
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: PlatformModeChecker.isDarkMode()
              ? AppColors().secondaryDarkColor
              : AppColors().secondaryLightColor,
        ),
        child: Padding(
          padding: AppSpacing.buttonTextPadding,
          child: child,
        ),
      ),
    );
  }
}
