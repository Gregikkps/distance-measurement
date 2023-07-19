// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_app/resources/theme/theme_data.dart';
import 'package:flutter_app/screens/distance/distance.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      theme: CustomThemeData.themeData,
      home: const DistanceScreen(),
    );
  }
}
