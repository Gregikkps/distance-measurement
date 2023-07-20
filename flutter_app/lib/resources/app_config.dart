class AppConfig {
  static String wifiIp = "192.168.4.22";
  static int maxDistance = 350;
  static Duration timeoutDuration = const Duration(seconds: 5);
  static Duration frequency = const Duration(seconds: 1);
  static Uri distanceUri = Uri.parse('http://$wifiIp/');
}
