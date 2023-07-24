import 'package:distance_measurement_app/provider/app_state.dart';
import 'package:distance_measurement_app/resources/tools/network_parametrs_inspector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NetworkUtils {
  void getGatewayIP(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    NetworkParametersInspector().getWifiGatewayIP(appState);
  }
}
