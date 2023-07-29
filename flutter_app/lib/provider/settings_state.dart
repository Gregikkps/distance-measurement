import 'package:flutter/material.dart';

class SettingsState with ChangeNotifier {
  String _connectionStatus = '';

  String get connectionStatus => _connectionStatus;

  void setConnectionStatus(String currentWifiGatewayIP) {
    _connectionStatus = currentWifiGatewayIP;
    notifyListeners();
  }

  void resetConnectionStatus() {
    _connectionStatus = '';
    notifyListeners();
  }
}
