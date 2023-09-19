import 'package:distance_measurement_app/components/custom_appbar.dart';
import 'package:distance_measurement_app/components/custom_background.dart';
import 'package:distance_measurement_app/provider/settings/settings_state.dart';
import 'package:distance_measurement_app/resources/app_assets/app_assets.dart';
import 'package:distance_measurement_app/resources/theme/app_colors.dart';
import 'package:distance_measurement_app/screens/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreenView extends StatelessWidget {
  final SettingsScreenState state;
  const SettingsScreenView(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    final Color secondaryColor = Theme.of(context).colorScheme.secondary;
    final SettingsState settingsState = Provider.of<SettingsState>(context);
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: CustomAppBar(
        title: Text(appLocalizations.settingsView_title),
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
                        title: Text(appLocalizations.settingsView_customTheme),
                      ),
                      if (settingsState.customThemeSwitchValue) ...[
                        SettingsTile.navigation(
                          leading: const Icon(Icons.system_update),
                          title: Text(appLocalizations.settingsView_systemMode),
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
                          leading: const Icon(Icons.light_mode),
                          title: Text(appLocalizations.settingsView_lightMode),
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
                          leading: const Icon(Icons.dark_mode),
                          title: Text(appLocalizations.settingsView_darkMode),
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
                  SettingsSection(
                    title: const SizedBox(),
                    tiles: <SettingsTile>[
                      SettingsTile.switchTile(
                        onToggle: (value) {
                          settingsState.setCustomLanguageSwitchValue(value);
                        },
                        initialValue: settingsState.customLanguageSwitchValue,
                        leading: const Icon(Icons.language),
                        title: Text(appLocalizations.settingsView_customLanguage),
                      ),
                      if (settingsState.customLanguageSwitchValue) ...[
                        SettingsTile.navigation(
                          leading: const Text('🇵🇱'),
                          title: Text(appLocalizations.settingsView_polish),
                          trailing: Radio<bool>(
                            key: key,
                            value: true,
                            groupValue: settingsState.appLocale == const Locale('pl'),
                            onChanged: (value) {
                              settingsState.savePrefsLanguage(const Locale('pl'));
                            },
                          ),
                        ),
                        SettingsTile.navigation(
                          leading: const Text('🏴󠁧󠁢󠁥󠁮󠁧󠁿'),
                          title: Text(appLocalizations.settingsView_english),
                          trailing: Radio<bool>(
                            key: key,
                            value: true,
                            groupValue: settingsState.appLocale == const Locale('en'),
                            onChanged: (value) {
                              settingsState.savePrefsLanguage(const Locale('en'));
                            },
                          ),
                        ),
                      ],
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
