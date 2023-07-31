import 'package:flutter/material.dart';

class MenuState with ChangeNotifier {
  int _currentPage = 0;

  int get currentPage => _currentPage;

  void updateCurrentPage(int index) {
    if (index == currentPage) return;
    _currentPage = index;
    notifyListeners();
  }
}
