import 'package:distance_measurement_app/components/custom_appbar.dart';
import 'package:distance_measurement_app/components/custom_background.dart';
import 'package:distance_measurement_app/resources/app_assets/app_assets.dart';
import 'package:distance_measurement_app/resources/text/settings_text.dart';
import 'package:distance_measurement_app/resources/theme/app_colors.dart';
import 'package:distance_measurement_app/screens/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsScreenView extends StatelessWidget {
  final SettingsScreenState state;
  const SettingsScreenView(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).colorScheme.primary;
    Color secondaryColor = Theme.of(context).colorScheme.secondary;
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text(SettingsText.title),
      ),
      body: Stack(
        children: [
          CustomBackground(image: AppAssets.menuBackground),
          SettingsList(
            lightTheme: SettingsThemeData(
              settingsListBackground: AppColors.transparent,
              settingsSectionBackground: secondaryColor,
            ),
            darkTheme: SettingsThemeData(
              settingsListBackground: AppColors.transparent,
              settingsSectionBackground: secondaryColor,
            ),
            applicationType: ApplicationType.material,
            sections: [
              SettingsSection(
                title: const SizedBox(),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(title: const Text('Appearance')),
                  SettingsTile.switchTile(
                    activeSwitchColor: primaryColor,
                    onToggle: (value) {},
                    initialValue: false,
                    leading: const Icon(Icons.format_paint),
                    title: const Text('Enable custom theme'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
