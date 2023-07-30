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
                  SettingsTile.navigation(title: const Text(SettingsText.appearance)),
                  SettingsTile.switchTile(
                    activeSwitchColor: primaryColor,
                    onToggle: (value) {
                      state.customThemeSwitchValue = value;
                    },
                    initialValue: state.customThemeSwitchValue,
                    leading: const Icon(Icons.format_paint),
                    title: const Text(SettingsText.enableCustomTheme),
                  ),
                  SettingsTile.navigation(
                    onPressed: (context) {},
                    leading: const Icon(Icons.system_update),
                    title: const Text("System mode"),
                    value: const Text('on'),
                  ),
                  SettingsTile.navigation(
                    onPressed: (context) {},
                    leading: const Icon(Icons.dark_mode),
                    title: const Text("Dark mode"),
                    value: const Text('off'),
                  ),
                  SettingsTile.navigation(
                    onPressed: (context) {},
                    leading: const Icon(Icons.light_mode),
                    trailing: Radio<bool>(
                      key: key,
                      value: false,
                      groupValue: false,
                      onChanged: (value) {},
                    ),
                    title: const Text("Light mode"),
                    value: const Text('off'),
                  ),
                ],
              ),
              SettingsSection(
                title: const SizedBox(),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                    title: const Text(SettingsText.advancedSettings),
                  ),
                  SettingsTile.switchTile(
                    activeSwitchColor: primaryColor,
                    onToggle: (value) {},
                    initialValue: false,
                    leading: const Icon(Icons.format_paint),
                    title: const Text(SettingsText.enableCustomTheme),
                  ),
                ],
              ),
              SettingsSection(
                title: const SizedBox(),
                tiles: <SettingsTile>[
                  SettingsTile.switchTile(
                    activeSwitchColor: primaryColor,
                    onToggle: (value) {
                      state.customThemeSwitchValue = value;
                      // state.selectedThemeMode = value ? ThemeMode.dark : ThemeMode.light;
                      // state._saveThemeMode(state.selectedThemeMode);
                      // state.setState(() {});
                    },
                    initialValue: state.customThemeSwitchValue,
                    leading: const Icon(Icons.format_paint),
                    title: const Text(SettingsText.enableCustomTheme),
                  ),
                  // SettingsTile.switchTile(
                  //   title: const Text('System theme'),
                  //   leading: Radio<ThemeMode>(
                  //     value: ThemeMode.system,
                  //     groupValue: state.selectedThemeMode,
                  //     onChanged: (value) {
                  //       state.selectedThemeMode = value!;
                  //       state._saveThemeMode(state.selectedThemeMode);
                  //       state.setState(() {});
                  //     },
                  //   ),
                  //   initialValue: null,
                  //   onToggle: (bool value) {},
                  // ),
                  // SettingsTile.switchTile(
                  //   title: const Text('Light theme'),
                  //   leading: Radio<ThemeMode>(
                  //     value: ThemeMode.light,
                  //     groupValue: state.selectedThemeMode,
                  //     onChanged: (value) {
                  //       state.selectedThemeMode = value!;
                  //       state._saveThemeMode(state.selectedThemeMode);
                  //       state.setState(() {});
                  //     },
                  //   ),
                  //   initialValue: null,
                  //   onToggle: (bool value) {},
                  // ),
                  // SettingsTile.switchTile(
                  //   title: const Text('Dark theme'),
                  //   leading: Radio<ThemeMode>(
                  //     value: ThemeMode.dark,
                  //     groupValue: state.selectedThemeMode,
                  //     onChanged: (value) {
                  //       state.selectedThemeMode = value!;
                  //       state._saveThemeMode(state.selectedThemeMode);
                  //       state.setState(() {});
                  //     },
                  //   ),
                  //   initialValue: null,
                  //   onToggle: (bool value) {},
                  // ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
