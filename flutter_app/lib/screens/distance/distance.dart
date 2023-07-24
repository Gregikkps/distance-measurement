import 'dart:async';
import 'package:distance_measurement_app/provider/app_state.dart';
import 'package:distance_measurement_app/resources/tools/network_parametrs_inspector.dart';
import 'package:flutter/material.dart';
import 'package:distance_measurement_app/components/custom_snackbar.dart';
import 'package:distance_measurement_app/resources/app_config.dart';
import 'package:distance_measurement_app/screens/distance/distance_utils.dart';
import 'package:distance_measurement_app/screens/distance/distance_view.dart';
import 'package:provider/provider.dart';

class DistanceScreen extends StatefulWidget {
  const DistanceScreen({super.key});

  @override
  State<DistanceScreen> createState() => DistanceScreenState();
}

class DistanceScreenState extends State<DistanceScreen> {
  void showCustomSnackbarError(String errorString) {
    CustomSnackbar.showError(context, errorString);
  }

  void getGatewayIP() {
    final appState = Provider.of<AppState>(context, listen: false);
    NetworkParametersInspector().getWifiGatewayIP(appState);
  }

  void fetchDataAndHandleState() {
    final appState = Provider.of<AppState>(context, listen: false);
    if (appState.wifiGatewayIP != AppConfig.wifiGatewayIP) {
      return;
    }
    if (appState.isFetchingData) return;

    appState.setFetchingData();

    DistanceUtils().fetchDataFromServer().then((response) {
      if (response.statusCode == 200) {
        final int parsedBody = DistanceUtils().parseDistance(response.body);
        appState.setDistance(parsedBody);
        appState.setConnect();
      } else {
        final errorString = "${response.statusCode.toString()} ${response.body}";
        showCustomSnackbarError(errorString);
        appState.resetConnect();
        appState.resetDistance();
        appState.resetWifiGatewayIP();
      }
    }).catchError((e) {
      final errorMessage = e.toString();
      showCustomSnackbarError(errorMessage);
      appState.resetConnect();
      appState.resetDistance();
      appState.resetWifiGatewayIP();
    }).whenComplete(() {
      appState.resetFetchingData();
    });
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(AppConfig.frequency, (Timer timer) {
      getGatewayIP();
      fetchDataAndHandleState();
    });
  }

  @override
  Widget build(BuildContext context) => DistanceScreenView(this);
}
