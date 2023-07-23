import 'package:flutter/material.dart';

class PlatformModeChecker {
  static bool? _isDarkMode;

  static bool isDarkMode() {
    _isDarkMode = WidgetsBinding.instance.platformDispatcher.platformBrightness == Brightness.dark;
    return _isDarkMode!;
  }
}
