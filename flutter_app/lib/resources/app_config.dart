class AppConfig {
  static int maxDistance = 350;
  static Duration timeoutDuration = const Duration(seconds: 5);
  static Duration frequency = const Duration(seconds: 1);
  static Uri distanceUri = Uri.parse('http://192.168.4.22/');
}
