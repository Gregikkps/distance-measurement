import 'dart:async';

import 'package:distance_measurement_app/components/custom_drawer.dart';
import 'package:distance_measurement_app/provider/app_state.dart';
import 'package:distance_measurement_app/provider/menu_state.dart';
import 'package:distance_measurement_app/resources/app_config.dart';
import 'package:distance_measurement_app/utils/distance_utils.dart';
import 'package:distance_measurement_app/utils/network_utils.dart';
import 'package:flutter/material.dart';
import 'package:distance_measurement_app/resources/theme/theme_data.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final appState = AppState();
  final menuState = MenuState();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: appState),
        ChangeNotifierProvider.value(value: menuState),
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
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(AppConfig.frequency, (Timer timer) {
      NetworkUtils().getGatewayIP(context);
      DistanceUtils(scaffoldMessengerKey).fetchDistanceDataAndHandleState(context);
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final drawerController = ZoomDrawerController();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomThemeData.lightThemeData,
      darkTheme: CustomThemeData.darkThemeData,
      themeMode: ThemeMode.system,
      home: ScaffoldMessenger(
        key: scaffoldMessengerKey,
        child: CustomDrawer(
          drawerController: drawerController,
        ),
      ),
    );
  }
}
