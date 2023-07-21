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
  State<DistanceScreen> createState() => DistanceScreenController();
}

class DistanceScreenController extends State<DistanceScreen> {
  int distance = 0;
  bool isConnected = false;
  bool isFetchingData = false;

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
    if (isFetchingData) return;

    setState(() {
      isFetchingData = true;
    });
    DistanceUtils().fetchDataFromServer().then((response) {
      if (response.statusCode == 200) {
        final int parsedBody = DistanceUtils().parseDistance(response.body);
        setState(() {
          distance = parsedBody;
          isConnected = true;
        });
      } else {
        final errorString = "${response.statusCode.toString()} ${response.body}";
        showCustomSnackbarError(errorString);
        setState(() {
          isConnected = false;
          distance = 0;
          appState.resetWifiGatewayIP();
        });
      }
    }).catchError((e) {
      final errorMessage = e.toString();
      showCustomSnackbarError(errorMessage);
      setState(() {
        isConnected = false;
        distance = 0;
        appState.resetWifiGatewayIP();
      });
    }).whenComplete(() {
      setState(() {
        isFetchingData = false;
      });
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
