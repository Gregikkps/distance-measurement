import 'package:distance_measurement_app/provider/app/app_state.dart';
import 'package:distance_measurement_app/provider/settings/settings_state.dart';
import 'package:distance_measurement_app/resources/tools/network_parametrs_inspector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NetworkUtils {
  void getGatewayIP(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    NetworkParametersInspector().getWifiGatewayIP(appState);
  }

  void getAllNetworkInfo(BuildContext context) {
    final appState = Provider.of<SettingsState>(context, listen: false);
    NetworkParametersInspector().getAllNetworkInfo(appState, context);
  }
}
