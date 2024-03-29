import 'package:distance_measurement_app/components/custom_background.dart';
import 'package:distance_measurement_app/provider/app/app_state.dart';
import 'package:distance_measurement_app/resources/app_assets/app_assets.dart';
import 'package:distance_measurement_app/resources/theme/app_colors.dart';
import 'package:distance_measurement_app/resources/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:distance_measurement_app/components/custom_card.dart';
import 'package:distance_measurement_app/components/custom_appbar.dart';
import 'package:distance_measurement_app/resources/app_spacing/app_spacing.dart';
import 'package:distance_measurement_app/screens/distance/distance.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DistanceScreenView extends StatefulWidget {
  final DistanceScreenState state;
  const DistanceScreenView(this.state, {super.key});

  @override
  State<DistanceScreenView> createState() => _DistanceScreenViewState();
}

class _DistanceScreenViewState extends State<DistanceScreenView> {
  @override
  Widget build(BuildContext context) {
    final AppState appState = Provider.of<AppState>(context);
    final textTheme = Theme.of(context).extension<TextThemeExtension>()!;
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(AppLocalizations.of(context)!.distanceView_title),
      ),
      body: Stack(
        children: [
          CustomBackground(image: AppAssets.distanceBackground),
          Padding(
            padding: AppSpacing.standardPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: CustomCard(
                    child: Padding(
                      padding: AppSpacing.standardPadding,
                      child: Text(
                        appState.isConnected
                            ? appLocalizations.global_connected
                            : appLocalizations.global_disconnected,
                        style: textTheme.bodyLarge.copyWith(
                          color: appState.isConnected
                              ? AppColors.greenTextColor
                              : AppColors.redTextColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: CustomCard(
                    child: Padding(
                      padding: AppSpacing.standardPadding,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Text(
                              '${appLocalizations.global_distance}:',
                              style: textTheme.bodyLarge,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Flexible(
                            child: Consumer(
                              builder: (context, value, child) {
                                return Text(
                                  ' ${appState.distane} ${appLocalizations.distanceView_cm}',
                                  style: textTheme.bodyLarge,
                                  textAlign: TextAlign.center,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
