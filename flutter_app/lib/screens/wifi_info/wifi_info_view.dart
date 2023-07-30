import 'package:distance_measurement_app/components/custom_appbar.dart';
import 'package:distance_measurement_app/components/custom_background.dart';
import 'package:distance_measurement_app/provider/app_state.dart';
import 'package:distance_measurement_app/provider/settings_state.dart';
import 'package:distance_measurement_app/resources/app_assets/app_assets.dart';
import 'package:distance_measurement_app/resources/text/app_text.dart';
import 'package:distance_measurement_app/resources/text/wifi_info_text.dart';
import 'package:distance_measurement_app/resources/theme/app_colors.dart';
import 'package:distance_measurement_app/resources/theme/text_style.dart';
import 'package:distance_measurement_app/screens/wifi_info/wifi_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

class InfoScreenView extends StatelessWidget {
  final InfoScreenState state;
  const InfoScreenView(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    SettingsState settingsState = Provider.of<SettingsState>(context);
    Color secondaryColor = Theme.of(context).colorScheme.secondary;
    final textTheme = Theme.of(context).extension<TextThemeExtension>()!;
    AppState appState = Provider.of<AppState>(context);
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text(WifiInfoText.title),
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
                    title: const Text(WifiInfoText.connectedToDevice),
                  ),
                  SettingsTile.navigation(
                    leading: const Icon(Icons.leak_add),
                    title: Consumer(
                      builder: (context, value, child) {
                        return Text(
                          appState.isConnected ? AppText.connected : AppText.disconnected,
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
                    title: const Text(WifiInfoText.connectedWiFiInfo),
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