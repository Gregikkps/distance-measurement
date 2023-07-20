import 'package:distance_measurement_app/resources/app_config.dart';
import 'package:distance_measurement_app/resources/text/app_text.dart';
import 'package:http/http.dart' as http;

class DistanceUtils {
  Future<http.Response> fetchDataFromServer() async {
    try {
      return await http.get(AppConfig.distanceUri).timeout(
        AppConfig.timeoutDuration,
        onTimeout: () {
          return http.Response(AppText.timeoutError, 408);
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  int parseDistance(String responseBody) {
    final int parsedBody = int.tryParse(responseBody) ?? 0;
    return parsedBody < AppConfig.maxDistance ? parsedBody : 0;
  }
}
