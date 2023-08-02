import 'package:distance_measurement_app/components/custom_appbar.dart';
import 'package:distance_measurement_app/components/custom_background.dart';
import 'package:distance_measurement_app/resources/app_assets/app_assets.dart';
import 'package:distance_measurement_app/resources/text/help_text.dart';
import 'package:distance_measurement_app/resources/theme/app_colors.dart';
import 'package:distance_measurement_app/screens/help/help.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class HelpScreenView extends StatelessWidget {
  final HelpScreenState state;
  const HelpScreenView(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    Color secondaryColor = Theme.of(context).colorScheme.secondary;
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text(HelpText.title),
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
                  SettingsTile.navigation(
                    title: const Text(HelpText.step1),
                  ),
                  SettingsTile.navigation(
                    leading: const Icon(Icons.power),
                    title: const Text(HelpText.turnOnDevice),
                  ),
                ],
              ),
              SettingsSection(
                title: const SizedBox(),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                    title: const Text(HelpText.step2),
                  ),
                  SettingsTile.navigation(
                    leading: const Icon(Icons.wifi),
                    title: const Text(HelpText.connectYourPhone),
                  ),
                ],
              ),
              SettingsSection(
                title: const SizedBox(),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                    title: const Text(HelpText.step3),
                  ),
                  SettingsTile.navigation(
                    leading: const Icon(Icons.visibility),
                    title: const Text(HelpText.goToDistanceView),
                  ),
                ],
              ),
              SettingsSection(
                title: const SizedBox(),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                    title: const Text(HelpText.done),
                  ),
                  SettingsTile.navigation(
                    leading: const Icon(Icons.straighten),
                    title: const Text(HelpText.nowYouCanMeasure),
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
