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
  String distance = '';
  bool isConnected = false;
  void fetchData() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.4.22/'));
      if (response.statusCode == 200) {
        setState(() {
          distance = '${response.body} cm';
          isConnected = true;
        });
      } else {
        isConnected = false;
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      isConnected = false;
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
