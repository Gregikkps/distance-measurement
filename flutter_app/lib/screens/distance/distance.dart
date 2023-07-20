import 'dart:async';
import 'package:flutter/material.dart';
import 'package:distance_measurement_app/components/custom_snackbar.dart';
import 'package:distance_measurement_app/resources/app_config.dart';
import 'package:distance_measurement_app/screens/distance/distance_utils.dart';
import 'package:distance_measurement_app/screens/distance/distance_view.dart';

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

  void fetchDataAndHandleState() {
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
        });
      }
    }).catchError((e) {
      final errorMessage = e.toString();
      showCustomSnackbarError(errorMessage);
      setState(() {
        isConnected = false;
        distance = 0;
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
      fetchDataAndHandleState();
    });
  }

  @override
  Widget build(BuildContext context) => DistanceScreenView(this);
}
