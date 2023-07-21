import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  String _wifiGatewayIP = '';

  String get wifiGatewayIP => _wifiGatewayIP;

  void setWifiGatewayIP(String currentWifiGatewayIP) {
    _wifiGatewayIP = currentWifiGatewayIP;
    notifyListeners();
  }

  void resetWifiGatewayIP() {
    _wifiGatewayIP = '';
    notifyListeners();
  }
}
