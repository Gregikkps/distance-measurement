import 'package:distance_measurement_app/components/custom_appbar.dart';
import 'package:distance_measurement_app/components/custom_background.dart';
import 'package:distance_measurement_app/provider/settings/settings_state.dart';
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
                sections: [
                  SettingsSection(
                    title: const SizedBox(),
                    tiles: <SettingsTile>[
                      SettingsTile.switchTile(
                        onToggle: (value) {
                          settingsState.setCustomThemeSwitchValue(value);
                        },
                        initialValue: settingsState.customThemeSwitchValue,
                        leading: const Icon(Icons.format_paint),
                        title: const Text(SettingsText.enableCustomTheme),
                      ),
                      if (settingsState.customThemeSwitchValue) ...[
                        SettingsTile.navigation(
                          onPressed: (context) {},
                          leading: const Icon(Icons.system_update),
                          title: const Text("System mode"),
                          trailing: Radio<bool>(
                            key: key,
                            value: true,
                            groupValue: settingsState.themeMode == ThemeMode.system,
                            onChanged: (value) {
                              settingsState.savePrefsThemeMode(ThemeMode.system);
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
                              settingsState.savePrefsThemeMode(ThemeMode.light);
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
                              settingsState.savePrefsThemeMode(ThemeMode.dark);
                            },
                          ),
                        ),
                      ],
                    ],
                  ),
                  // SettingsSection(
                  //   tiles: [
                  //     SettingsTile(
                  //       onPressed: (context) => toNotificationsScreen(),
                  //       title: const Text('Network & internet'),
                  //       description: const Text('Mobile, Wi-Fi, hotspot'),
                  //       leading: const Icon(Icons.wifi),
                  //     ),
                  //     SettingsTile(
                  //       onPressed: (context) => toNotificationsScreen(context),
                  //       title: const Text('Connected devices'),
                  //       description: const Text('Bluetooth, pairing'),
                  //       leading: const Icon(Icons.devices_other),
                  //     ),
                  //     SettingsTile(
                  //       onPressed: (context) => toNotificationsScreen(context),
                  //       title: const Text('Apps'),
                  //       description: const Text('Assistant, recent apps, default apps'),
                  //       leading: const Icon(Icons.apps),
                  //     ),
                  //     SettingsTile(
                  //       onPressed: (context) => toNotificationsScreen(context),
                  //       title: const Text('Notifications'),
                  //       description: const Text('Notification history, conversations'),
                  //       leading: const Icon(Icons.notifications_none),
                  //     ),
                  //     SettingsTile(
                  //       onPressed: (context) => toNotificationsScreen(context),
                  //       title: const Text('Battery'),
                  //       description: const Text('100%'),
                  //       leading: const Icon(Icons.battery_full),
                  //     ),
                  //     SettingsTile(
                  //       onPressed: (context) => toNotificationsScreen(context),
                  //       title: const Text('Storage'),
                  //       description: const Text('30% used - 5.60 GB free'),
                  //       leading: const Icon(Icons.storage),
                  //     ),
                  //     SettingsTile(
                  //       onPressed: (context) => toNotificationsScreen(context),
                  //       title: const Text('Sound & vibration'),
                  //       description: const Text('Volume, haptics, Do Not Disturb'),
                  //       leading: const Icon(Icons.volume_up_outlined),
                  //     ),
                  //     SettingsTile(
                  //       onPressed: (context) => toNotificationsScreen(context),
                  //       title: const Text('Display'),
                  //       enabled: false,
                  //       description: const Text('Dark theme, font size, brightness'),
                  //       leading: const Icon(Icons.brightness_6_outlined),
                  //     ),
                  //     SettingsTile(
                  //       onPressed: (context) => toNotificationsScreen(context),
                  //       title: const Text('Wallpaper & style'),
                  //       description: const Text('Colors, themed icons, app grid'),
                  //       leading: const Icon(Icons.palette_outlined),
                  //     ),
                  //     SettingsTile(
                  //       onPressed: (context) => toNotificationsScreen(context),
                  //       title: const Text('Accessibility'),
                  //       description: const Text('Display, interaction, audio'),
                  //       leading: const Icon(Icons.accessibility),
                  //     ),
                  //     SettingsTile(
                  //       onPressed: (context) => toNotificationsScreen(context),
                  //       title: const Text('Security'),
                  //       description: const Text('Screen lock, Find My Device, app security'),
                  //       leading: const Icon(Icons.lock_outline),
                  //     ),
                  //     SettingsTile(
                  //       onPressed: (context) => toNotificationsScreen(context),
                  //       title: const Text('Location'),
                  //       description: const Text('On - 3 apps have access to location'),
                  //       leading: const Icon(Icons.location_on_outlined),
                  //     ),
                  //   ],
                  // ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
