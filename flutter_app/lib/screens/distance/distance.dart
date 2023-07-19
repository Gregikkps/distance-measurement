import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/components/custom_snackbar.dart';
import 'package:flutter_app/screens/distance/distance_view.dart';
import 'package:http/http.dart' as http;

class DistanceScreen extends StatefulWidget {
  const DistanceScreen({super.key});

  @override
  State<DistanceScreen> createState() => DistanceScreenController();
}

class DistanceScreenController extends State<DistanceScreen> {
  int distance = 0;
  bool isConnected = false;
  int maxDistance = 350;
  bool isFetchingData = false;
  String error = '';

  void showCustomSnackbarError(String errorString) {
    CustomSnackbar.showError(context, errorString);
  }

  void fetchData() async {
    if (isFetchingData) return;
    setState(() {
      isFetchingData = true;
    });
    try {
      final response = await http
          .get(Uri.parse('http://192.168.4.22/'))
          .timeout(const Duration(seconds: 1), onTimeout: () {
        return http.Response(
            'Error: ClientException with SocketException: Connection timed out (OS Error: Connection timed out, errno = 110)',
            408);
      });
      if (response.statusCode == 200) {
        setState(() {
          if (int.parse(response.body) < maxDistance) {
            distance = int.parse(response.body);
            isConnected = true;
          }
          if (int.parse(response.body) >= maxDistance) {
            distance = 0;
            isConnected = true;
          }
        });
      } else {
        final errorString = "${response.statusCode.toString()} ${response.body}";
        showCustomSnackbarError(errorString);
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      showCustomSnackbarError(e.toString());
      setState(() {
        isConnected = false;
        distance = 0;
      });

      print('Error: $e');
    } finally {
      setState(() {
        isFetchingData = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 2), (timer) {
      fetchData();
    });
  }

  @override
  Widget build(BuildContext context) => DistanceScreenView(this);
}
