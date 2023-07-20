import 'package:flutter/material.dart';
import 'package:distance_measurement_app/resources/app_distance/app_distance.dart';
import 'package:distance_measurement_app/resources/theme/app_colors.dart';

class BlackCard extends StatelessWidget {
  final Widget child;

  const BlackCard({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.primaryColor
        ),
        child: Padding(
          padding: AppDistance.buttonTextPadding,
          child: child,
        ),
      ),
    );
  }
}
