import 'package:distance_measurement_app/components/custom_appbar.dart';
import 'package:distance_measurement_app/components/custom_background.dart';
import 'package:distance_measurement_app/provider/app/app_state.dart';
import 'package:distance_measurement_app/provider/settings/settings_state.dart';
import 'package:distance_measurement_app/resources/app_assets/app_assets.dart';
import 'package:distance_measurement_app/resources/theme/app_colors.dart';
import 'package:distance_measurement_app/resources/theme/text_style.dart';
import 'package:distance_measurement_app/screens/wifi_info/wifi_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WifiInfoScreenView extends StatelessWidget {
  final WifiInfoScreenState state;
  const WifiInfoScreenView(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsState settingsState = Provider.of<SettingsState>(context);
    final Color secondaryColor = Theme.of(context).colorScheme.secondary;
    final TextThemeExtension textTheme = Theme.of(context).extension<TextThemeExtension>()!;
    final AppState appState = Provider.of<AppState>(context);
    final AppLocalizations appLocalizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: Text(appLocalizations.wifiInfoView_title),
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
                    title: Text(appLocalizations.wifiInfoView_distanceDeviceConnectionStatus),
                  ),
                  SettingsTile.navigation(
                    leading: const Icon(Icons.leak_add),
                    title: Consumer(
                      builder: (context, value, child) {
                        return Text(
                          appState.isConnected
                              ? AppLocalizations.of(context).global_connected
                              : AppLocalizations.of(context).global_disconnected,
                          style: textTheme.bodyLarge.copyWith(
                            color: appState.isConnected
                                ? AppColors.greenTextColor
                                : AppColors.redTextColor,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              SettingsSection(
                title: const SizedBox(),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                    title: Text(appLocalizations.wifiInfoView_lastConnectedWiFiInfo),
                  ),
                  SettingsTile.navigation(
                    leading: const Icon(Icons.network_check),
                    title: Consumer(
                      builder: (context, value, child) {
                        return Text(
                          settingsState.connectionStatus,
                          style: textTheme.bodyMedium,
                        );
                      },
                    ),
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
