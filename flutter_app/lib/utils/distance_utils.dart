import 'package:distance_measurement_app/provider/app/app_state.dart';
import 'package:distance_measurement_app/resources/app_config.dart';
import 'package:distance_measurement_app/resources/text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class DistanceUtils {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;

  DistanceUtils(this.scaffoldMessengerKey);
  Future<http.Response> _fetchDataFromServer() async {
    try {
      return await http.get(AppConfig.distanceUri).timeout(
        AppConfig.timeoutDuration,
        onTimeout: () {
          return http.Response(AppText.timeoutError, 408);
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  int _parseDistance(String responseBody) {
    final int parsedBody = int.tryParse(responseBody) ?? 0;
    return parsedBody < AppConfig.maxDistance ? parsedBody : 0;
  }

  void _showCustomSnackbarError(BuildContext context, String errorString) {
    final snackBar = SnackBar(content: Text(errorString));
    scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }

  void _handleSuccessResponse(http.Response response, BuildContext context) {
    final int parsedBody = _parseDistance(response.body);
    final appState = Provider.of<AppState>(context, listen: false);
    appState.setDistance(parsedBody);
    appState.setConnect();
  }

  void _handleErrorResponse(http.Response response, BuildContext context) {
    final errorString = "${response.statusCode.toString()} ${response.body}";
    _showCustomSnackbarError(context, errorString);
    final appState = Provider.of<AppState>(context, listen: false);
    appState.resetConnect();
    appState.resetDistance();
    appState.resetWifiGatewayIP();
  }

  void _handleError(dynamic error, BuildContext context) {
    final errorMessage = error.toString();
    _showCustomSnackbarError(context, errorMessage);
    final appState = Provider.of<AppState>(context, listen: false);
    appState.resetConnect();
    appState.resetDistance();
    appState.resetWifiGatewayIP();
  }

  void fetchDistanceDataAndHandleState(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    if (appState.wifiGatewayIP != AppConfig.wifiGatewayIP) {
      return;
    }
    if (appState.isFetchingData) return;

    appState.setFetchingData();

    _fetchDataFromServer().then((response) {
      if (response.statusCode == 200) {
        _handleSuccessResponse(response, context);
      } else {
        _handleErrorResponse(response, context);
      }
    }).catchError((e) {
      _handleError(e, context);
    }).whenComplete(() {
      appState.resetFetchingData();
    });
  }
}
