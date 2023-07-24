import 'package:distance_measurement_app/screens/settings/settings_view.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
   @override
  Widget build(BuildContext context) => SettingsScreenView(this);
}