import 'package:distance_measurement_app/components/custom_appbar.dart';
import 'package:distance_measurement_app/components/custom_background.dart';
import 'package:distance_measurement_app/resources/app_assets/app_assets.dart';
import 'package:distance_measurement_app/resources/text/app_text.dart';
import 'package:distance_measurement_app/screens/settings/settings.dart';
import 'package:flutter/material.dart';

class SettingsScreenView extends StatelessWidget {
  final SettingsScreenState state;
  const SettingsScreenView(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text(AppText.settings),
      ),
      body: Stack(
        children: [
          CustomBackground(image: AppAssets.menuBackground),
        ],
      ),
    );
  }
}
