import 'package:flutter/material.dart';

class DrawerConfig {
  static const SizedBox widthItemBox = SizedBox(width: 10);

  static List<MenuClass> mainMenu = [
    const MenuClass("Distance Measure", Icons.rule, 0),
    const MenuClass("promos", Icons.card_giftcard, 1),
    const MenuClass("notifications", Icons.notifications, 2),
    const MenuClass("help", Icons.help, 3),
    const MenuClass("about_us", Icons.info_outline, 4),
    const MenuClass("Exit", Icons.exit_to_app, 5),
  ];
}

class MenuClass {
  final String title;
  final IconData icon;
  final int index;

  const MenuClass(this.title, this.icon, this.index);
}
