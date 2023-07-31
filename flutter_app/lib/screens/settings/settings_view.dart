import 'package:distance_measurement_app/components/custom_appbar.dart';
import 'package:distance_measurement_app/components/custom_background.dart';
import 'package:distance_measurement_app/provider/settings_state.dart';
import 'package:distance_measurement_app/resources/app_assets/app_assets.dart';
import 'package:distance_measurement_app/resources/text/settings_text.dart';
import 'package:distance_measurement_app/resources/theme/app_colors.dart';
import 'package:distance_measurement_app/screens/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsScreenView extends StatelessWidget {
  final SettingsScreenState state;
  const SettingsScreenView(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    Color secondaryColor = Theme.of(context).colorScheme.secondary;
    SettingsState settingsState = Provider.of<SettingsState>(context);

    return Scaffold(
      appBar: const CustomAppBar(
        title: Text(SettingsText.title),
      ),
      body: Stack(
        children: [
          CustomBackground(image: AppAssets.menuBackground),
          Consumer(
            builder: (context, value, child) {
              return SettingsList(
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
                        onPressed: (context) {},
                        leading: const Icon(Icons.system_update),
                        title: const Text("System mode"),
                        trailing: Radio<bool>(
                          key: key,
                          value: true,
                          groupValue: settingsState.themeMode == ThemeMode.system,
                          onChanged: (value) {
                            settingsState.setThemeMode(ThemeMode.system);
                          },
                        ),
                      ),
                      SettingsTile.navigation(
                        onPressed: (context) {},
                        leading: const Icon(Icons.dark_mode),
                        title: const Text("Dark mode"),
                        trailing: Radio<bool>(
                          key: key,
                          value: true,
                          groupValue: settingsState.themeMode == ThemeMode.dark,
                          onChanged: (value) {
                            settingsState.setThemeMode(ThemeMode.dark);
                          },
                        ),
                      ),
                      SettingsTile.navigation(
                        onPressed: (context) {},
                        leading: const Icon(Icons.light_mode),
                        title: const Text("Light mode"),
                        trailing: Radio<bool>(
                          key: key,
                          value: true,
                          groupValue: settingsState.themeMode == ThemeMode.light,
                          onChanged: (value) {
                            settingsState.setThemeMode(ThemeMode.light);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
