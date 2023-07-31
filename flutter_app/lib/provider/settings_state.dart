import 'package:flutter/material.dart';

class SettingsState with ChangeNotifier {
  String _connectionStatus = '';
  ThemeMode _themeMode = ThemeMode.system;

  String get connectionStatus => _connectionStatus;
  ThemeMode get themeMode => _themeMode;

  void setConnectionStatus(String currentWifiGatewayIP) {
    _connectionStatus = currentWifiGatewayIP;
    notifyListeners();
  }

  void resetConnectionStatus() {
    _connectionStatus = '';
    notifyListeners();
  }

  void setThemeMode(ThemeMode newThemeMode) {
    _themeMode = newThemeMode;
    notifyListeners();
  }
}
