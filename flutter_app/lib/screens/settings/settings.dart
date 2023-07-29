import 'package:auto_route/auto_route.dart';
import 'package:distance_measurement_app/screens/settings/settings_view.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) => SettingsScreenView(this);
}
