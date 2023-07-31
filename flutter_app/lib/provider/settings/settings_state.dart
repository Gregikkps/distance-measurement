import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsState with ChangeNotifier {
  String _connectionStatus = '';
  ThemeMode _themeMode = ThemeMode.system;
  bool _customThemeSwitchValue = false;

  String get connectionStatus => _connectionStatus;
  ThemeMode get themeMode => _themeMode;
  bool get customThemeSwitchValue => _customThemeSwitchValue;

  void setConnectionStatus(String currentWifiGatewayIP) {
    _connectionStatus = currentWifiGatewayIP;
    notifyListeners();
  }

  void resetConnectionStatus() {
    _connectionStatus = '';
    notifyListeners();
  }

  Future<void> savePrefsThemeMode(ThemeMode newThemeMode) async {
    _themeMode = newThemeMode;
    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('theme_mode', _themeMode.index);
  }

  Future<void> loadPrefsThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? themeModeIndex = prefs.getInt('theme_mode');

    if (themeModeIndex != null) {
      _themeMode = ThemeMode.values[themeModeIndex];
      notifyListeners();
    }
  }

  void setCustomThemeSwitchValue(bool customThemeSwitchValue) {
    _customThemeSwitchValue = customThemeSwitchValue;
    notifyListeners();
  }
}
