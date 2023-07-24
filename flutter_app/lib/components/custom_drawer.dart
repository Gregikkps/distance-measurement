import 'package:distance_measurement_app/provider/menu_state.dart';
import 'package:distance_measurement_app/resources/drawer_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';

import '../screens/menu/menu.dart';

class CustomDrawer extends StatelessWidget {
  final ZoomDrawerController drawerController;
  const CustomDrawer({super.key, required this.drawerController});

  @override
  Widget build(BuildContext context) {
    void updatePage(int index) {
      context.read<MenuState>().updateCurrentPage(index);
      drawerController.toggle?.call();
    }

    return ZoomDrawer(
      controller: drawerController,
      menuScreen: MenuScreen(
        callback: updatePage,
        current: 0,
      ),
      style: DrawerStyle.style2,
      mainScreen: DrawerConfig.buildMainScreen(context),
      showShadow: true,
      angle: 0.0,
      menuBackgroundColor: Colors.grey,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
    );
  }
}
