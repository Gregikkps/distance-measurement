import 'package:flutter/material.dart';
import 'package:distance_measurement_app/components/black_card.dart';
import 'package:distance_measurement_app/components/custom_appbar.dart';
import 'package:distance_measurement_app/resources/app_distance/app_distance.dart';
import 'package:distance_measurement_app/resources/text/app_text.dart';
import 'package:distance_measurement_app/resources/text/app_text_style.dart';

import 'package:distance_measurement_app/screens/distance/distance.dart';
import 'package:provider/provider.dart';

import '../../provider/app_state.dart';

class DistanceScreenView extends StatefulWidget {
  final DistanceScreenController state;
  const DistanceScreenView(this.state, {super.key});

  @override
  State<DistanceScreenView> createState() => _DistanceScreenViewState();
}

class _DistanceScreenViewState extends State<DistanceScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text(AppText.title),
        actions: [
          Consumer(
            builder: (context, value, child) {
              AppState appState = Provider.of<AppState>(context);
              return Text(appState.wifiGatewayIP);
            },
          )
        ],
      ),
      body: Stack(
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.srcOver),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: AppDistance.standardPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: BlackCard(
                    child: Padding(
                      padding: AppDistance.standardPadding,
                      child: Text(
                        style: CustomTextStyle.bodyM.copyWith(
                          color: widget.state.isConnected ? Colors.green : Colors.redAccent,
                        ),
                        widget.state.isConnected ? AppText.connected : AppText.disconnected,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: BlackCard(
                    child: Padding(
                      padding: AppDistance.standardPadding,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            '${AppText.distance}:',
                            style: CustomTextStyle.bodyM,
                          ),
                          Text(
                            ' ${widget.state.distance} ${AppText.unitCm}',
                            style: CustomTextStyle.bodyM,
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
