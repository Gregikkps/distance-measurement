import 'package:auto_route/auto_route.dart';
import 'package:distance_measurement_app/screens/menu/menu_view.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MenuScreen extends StatefulWidget {
  final void Function(int)? callback;
  final int? current;
  const MenuScreen({super.key, this.callback, this.current});

  @override
  State<MenuScreen> createState() => MenuScreenState();
}

class MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) => MenuScreenView(this);
}
