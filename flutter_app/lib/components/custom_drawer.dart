import 'package:distance_measurement_app/provider/menu/menu_state.dart';
import 'package:distance_measurement_app/resources/drawer_config.dart';
import 'package:distance_measurement_app/resources/theme/app_colors.dart';
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
        current: context.watch<MenuState>().currentPage,
      ),
      style: DrawerStyle.style2,
      mainScreen: DrawerConfig.buildMainScreen(context),
      showShadow: true,
      angle: 0.0,
      menuBackgroundColor: AppColors.greyColor,
      slideWidth: MediaQuery.of(context).size.width * DrawerConfig.slideWidth,
      menuScreenWidth: MediaQuery.of(context).size.width * DrawerConfig.menuScreenWidth,
    );
  }
}
