import 'package:distance_measurement_app/resources/tools/color_changer.dart';
import 'package:flutter/material.dart';

class AppColors {
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  static const Color blueGreyColor = Colors.blueGrey;
  static const Color transparent = Colors.transparent;
  static const Color errorRed = Colors.red;

  static const Color whiteTextColor = Colors.white;
  static const Color blackTextColor = Colors.black;
  static const Color greenTextColor = Colors.green;
  static const Color redTextColor = Colors.red;

  MaterialColor primaryLightColor = ColorChanger().createMaterialSwatch(
    Colors.white70,
  );

  MaterialColor primaryDarkColor = ColorChanger().createMaterialSwatch(
    Colors.black87,
  );
}
