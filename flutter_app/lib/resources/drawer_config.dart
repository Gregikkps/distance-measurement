import 'dart:io';

import 'package:distance_measurement_app/provider/menu/menu_state.dart';
import 'package:distance_measurement_app/screens/distance/distance.dart';
import 'package:distance_measurement_app/screens/help/help.dart';
import 'package:distance_measurement_app/screens/wifi_info/wifi_info.dart';
import 'package:distance_measurement_app/screens/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DrawerConfig {
  final BuildContext context;
  DrawerConfig(this.context);

  static const SizedBox widthItemBox = SizedBox(width: 10);
  static const double slideWidth = 0.65;
  static const double menuScreenWidth = 0.75;

  static List<MenuClass> createMainMenu(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return [
      MenuClass(appLocalizations.menuView_distanceMeasurment, Icons.rule, 0),
      MenuClass(appLocalizations.menuView_help, Icons.help_center, 1),
      MenuClass(appLocalizations.menuView_settings, Icons.settings, 2),
      MenuClass(appLocalizations.menuView_wifiInfo, Icons.info, 3),
      MenuClass(appLocalizations.menuView_exit, Icons.exit_to_app, 4),
    ];
  }

  static Widget buildMainScreen(BuildContext context) {
    final currentPage = context.select<MenuState, int>((provider) => provider.currentPage);

    switch (currentPage) {
      case 0:
        return WillPopScope(
          onWillPop: () async => false,
          child: const DistanceScreen(),
        );
      case 1:
        return WillPopScope(
          onWillPop: () async => false,
          child: const HelpScreen(),
        );
      case 2:
        return WillPopScope(
          onWillPop: () async => false,
          child: const SettingsScreen(),
        );
      case 3:
        return WillPopScope(
          onWillPop: () async => false,
          child: const WifiInfoScreen(),
        );
      case 4:
        return exit(0);
      default:
        return WillPopScope(
          onWillPop: () async => false,
          child: const DistanceScreen(),
        );
    }
  }
}

class MenuClass {
  final String title;
  final IconData icon;
  final int index;

  const MenuClass(this.title, this.icon, this.index);
}
