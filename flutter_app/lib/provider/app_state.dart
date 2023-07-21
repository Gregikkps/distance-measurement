import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  String _wifiGatewayIP = '';
  int _distance = 0;
  bool _isConnected = false;
  bool _isFetchingData = false;

  String get wifiGatewayIP => _wifiGatewayIP;
  int get distane => _distance;
  bool get isConnected => _isConnected;
  bool get isFetchingData => _isFetchingData;

  void setWifiGatewayIP(String currentWifiGatewayIP) {
    _wifiGatewayIP = currentWifiGatewayIP;
    notifyListeners();
  }

  void setDistance(int distance) {
    _distance = distance;
    notifyListeners();
  }

  void setConnect() {
    _isConnected = true;
    notifyListeners();
  }

  void setFetchingData() {
    _isFetchingData = true;
    notifyListeners();
  }

  void resetWifiGatewayIP() {
    _wifiGatewayIP = '';
    notifyListeners();
  }

  void resetDistance() {
    _distance = 0;
    notifyListeners();
  }

  void resetConnect() {
    _isConnected = false;
    notifyListeners();
  }

  void resetFetchingData() {
    _isFetchingData = false;
    notifyListeners();
  }
}
