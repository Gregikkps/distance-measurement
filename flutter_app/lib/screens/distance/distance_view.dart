import 'package:distance_measurement_app/components/custom_background.dart';
import 'package:distance_measurement_app/resources/app_assets/app_assets.dart';
import 'package:distance_measurement_app/resources/theme/app_colors.dart';
import 'package:distance_measurement_app/resources/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:distance_measurement_app/components/custom_card.dart';
import 'package:distance_measurement_app/components/custom_appbar.dart';
import 'package:distance_measurement_app/resources/app_spacing/app_spacing.dart';
import 'package:distance_measurement_app/resources/text/app_text.dart';
import 'package:distance_measurement_app/screens/distance/distance.dart';
import 'package:provider/provider.dart';
import '../../provider/app_state.dart';

class DistanceScreenView extends StatefulWidget {
  final DistanceScreenState state;
  const DistanceScreenView(this.state, {super.key});

  @override
  State<DistanceScreenView> createState() => _DistanceScreenViewState();
}

class _DistanceScreenViewState extends State<DistanceScreenView> {
  @override
  Widget build(BuildContext context) {
    AppState appState = Provider.of<AppState>(context);
    final textTheme = Theme.of(context).extension<TextThemeExtension>()!;
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text(AppText.distanceMeasurement),
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
                        appState.isConnected ? AppText.connected : AppText.disconnected,
                        style: textTheme.bodyLarge.copyWith(
                          color: appState.isConnected
                              ? AppColors.greenTextColor
                              : AppColors.redTextColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Consumer(
                  builder: (context, value, child) {
                    return Text(appState.wifiGatewayIP);
                  },
                ),
                Center(
                  child: CustomCard(
                    child: Padding(
                      padding: AppSpacing.standardPadding,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('${AppText.distance}:', style: textTheme.bodyLarge),
                          Consumer(
                            builder: (context, value, child) {
                              return Text(
                                ' ${appState.distane} ${AppText.unitCm}',
                                style: textTheme.bodyLarge,
                              );
                            },
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
