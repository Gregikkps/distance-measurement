import 'dart:io';

import 'package:distance_measurement_app/provider/menu/menu_state.dart';
import 'package:distance_measurement_app/resources/text/menu_text.dart';
import 'package:distance_measurement_app/screens/distance/distance.dart';
import 'package:distance_measurement_app/screens/help/help.dart';
import 'package:distance_measurement_app/screens/wifi_info/wifi_info.dart';
import 'package:distance_measurement_app/screens/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerConfig {
  static const SizedBox widthItemBox = SizedBox(width: 10);
  static const double slideWidth = 0.65;
  static const double menuScreenWidth = 0.75;

  static List<MenuClass> mainMenu = [
    const MenuClass(MenuText.distanceMeasurement, Icons.rule, 0),
    const MenuClass(MenuText.help, Icons.help_center, 1),
    const MenuClass(MenuText.settings, Icons.settings, 2),
    const MenuClass(MenuText.wifiInfo, Icons.info, 3),
    const MenuClass(MenuText.exit, Icons.exit_to_app, 4),
  ];

  static Widget buildMainScreen(BuildContext context) {
    final currentPage = context.select<MenuState, int>((provider) => provider.currentPage);

    switch (currentPage) {
      case 0:
        return const DistanceScreen();
      case 1:
        return const HelpScreen();
      case 2:
        return const SettingsScreen();
      case 3:
        return const InfoScreen();
      case 4:
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
