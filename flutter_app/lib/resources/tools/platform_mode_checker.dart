import 'package:flutter/material.dart';

class PlatformModeChecker {
  static bool? _isDarkMode;

  static bool isDarkMode(BuildContext context) {
    _isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return _isDarkMode!;
  }
}
