import 'package:distance_measurement_app/components/custom_drawer.dart';
import 'package:distance_measurement_app/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class HomeScreenView extends StatelessWidget {
  final HomeScreenState state;
  const HomeScreenView(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    final drawerController = ZoomDrawerController();
    return Builder(
      builder: (context) => CustomDrawer(drawerController: drawerController),
    );
  }
}
