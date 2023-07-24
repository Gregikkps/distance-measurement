import 'dart:io';

import 'package:distance_measurement_app/provider/menu_state.dart';
import 'package:distance_measurement_app/resources/text/app_text.dart';
import 'package:distance_measurement_app/screens/distance/distance.dart';
import 'package:distance_measurement_app/screens/help/help.dart';
import 'package:distance_measurement_app/screens/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerConfig {
  static const SizedBox widthItemBox = SizedBox(width: 10);

  static List<MenuClass> mainMenu = [
    const MenuClass(AppText.distanceMeasurement, Icons.rule, 0),
    const MenuClass(AppText.settings, Icons.settings, 1),
    const MenuClass(AppText.help, Icons.help, 2),
    const MenuClass(AppText.exit, Icons.exit_to_app, 3),
  ];

  static Widget buildMainScreen(BuildContext context) {
    final currentPage = context.select<MenuState, int>((provider) => provider.currentPage);

    switch (currentPage) {
      case 0:
        return const DistanceScreen();
      case 1:
        return const SettingsScreen();
      case 2:
        return const HelpScreen();
      case 3:
        return exit(0);
      default:
        return const DistanceScreen(); 
    }
  }
}

class MenuClass {
  final String title;
  final IconData icon;
  final int index;

  const MenuClass(this.title, this.icon, this.index);
}
