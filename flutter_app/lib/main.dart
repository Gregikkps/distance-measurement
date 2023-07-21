import 'package:distance_measurement_app/provider/app_state.dart';
import 'package:flutter/material.dart';
import 'package:distance_measurement_app/resources/theme/theme_data.dart';
import 'package:distance_measurement_app/screens/distance/distance.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final appState = AppState();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: appState),
      ],
      child: const MyApp(),
    ),
  );
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
