class AppConfig {
  static const String serverIp = "192.168.4.22";
  static const String serverGatewayIP = "192.168.4.9";
  static const int maxDistance = 350;
  static const Duration timeoutDuration = Duration(seconds: 5);
  static const Duration frequency = Duration(seconds: 1);
  static Uri distanceUri = Uri.parse('http://$serverIp/');
  static const Duration snakcbarDuration = Duration(seconds: 4);
  static const int lightModeBackgroundOpacity = 350;
}
