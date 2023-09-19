import 'package:distance_measurement_app/components/custom_appbar.dart';
import 'package:distance_measurement_app/components/custom_background.dart';
import 'package:distance_measurement_app/resources/app_assets/app_assets.dart';
import 'package:distance_measurement_app/resources/theme/app_colors.dart';
import 'package:distance_measurement_app/screens/help/help.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HelpScreenView extends StatelessWidget {
  final HelpScreenState state;
  const HelpScreenView(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    final Color secondaryColor = Theme.of(context).colorScheme.secondary;
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: CustomAppBar(
        title: Text(appLocalizations.helpView_title),
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
                    title: Text(appLocalizations.helpView_step1),
                  ),
                  SettingsTile.navigation(
                    leading: const Icon(Icons.power),
                    title: Text(appLocalizations.helpView_turnOn),
                  ),
                ],
              ),
              SettingsSection(
                title: const SizedBox(),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                    title: Text(appLocalizations.helpView_step2),
                  ),
                  SettingsTile.navigation(
                    leading: const Icon(Icons.wifi),
                    title: Text(appLocalizations.helpView_connectYourPhone),
                  ),
                ],
              ),
              SettingsSection(
                title: const SizedBox(),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                    title: Text(appLocalizations.helpView_step3),
                  ),
                  SettingsTile.navigation(
                    leading: const Icon(Icons.visibility),
                    title: Text(appLocalizations.helpView_goToDistanceView),
                  ),
                ],
              ),
              SettingsSection(
                title: const SizedBox(),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                    title: Text(appLocalizations.helpView_done),
                  ),
                  SettingsTile.navigation(
                    leading: const Icon(Icons.straighten),
                    title: Text(appLocalizations.helpView_nowYouCanMeasure),
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
