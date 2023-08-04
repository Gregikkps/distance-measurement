import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsState with ChangeNotifier {
  String _connectionStatus = '';
  ThemeMode _themeMode = ThemeMode.system;
  bool _customThemeSwitchValue = false;
  Locale? _appLocale;
  bool _customLanguageSwitchValue = false;

  String get connectionStatus => _connectionStatus;
  ThemeMode get themeMode => _themeMode;
  bool get customThemeSwitchValue => _customThemeSwitchValue;
  Locale? get appLocale => _appLocale;
  bool get customLanguageSwitchValue => _customLanguageSwitchValue;

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

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('theme_mode', _themeMode.index);
    notifyListeners();
  }

  Future<void> loadPrefsThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? themeModeIndex = prefs.getInt('theme_mode');

    if (themeModeIndex != null) {
      _themeMode = ThemeMode.values[themeModeIndex];
    }
    notifyListeners();
  }

  void setCustomThemeSwitchValue(bool customThemeSwitchValue) {
    _customThemeSwitchValue = customThemeSwitchValue;
    notifyListeners();
  }

  void savePrefsLanguage(Locale type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _appLocale = type;

    if (type == const Locale('en')) {
      await prefs.setString('language_code', 'en');
    }

    if (type == const Locale('pl')) {
      await prefs.setString('language_code', 'pl');
    }
    notifyListeners();
  }

  Future<void> loadPrefsLanguageMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? lagnuageCode = prefs.getString('language_code');

    if (lagnuageCode != null) {
      _appLocale = Locale(lagnuageCode);
    }
    notifyListeners();
  }

  void setCustomLanguageSwitchValue(bool customLanguageSwitchValue) {
    _customLanguageSwitchValue = customLanguageSwitchValue;
    notifyListeners();
  }
}
