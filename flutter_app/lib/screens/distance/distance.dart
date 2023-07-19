import 'dart:async';

import 'package:flutter/material.dart';
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

  void fetchData() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.4.22/'));
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
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        isConnected = false;
        distance = 0;
      });

      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      fetchData();
    });
  }

  @override
  Widget build(BuildContext context) => DistanceScreenView(this);
}
