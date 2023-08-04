import 'dart:async';

import 'package:distance_measurement_app/provider/app/app_state.dart';
import 'package:distance_measurement_app/provider/menu/menu_state.dart';
import 'package:distance_measurement_app/provider/settings/settings_state.dart';
import 'package:distance_measurement_app/resources/app_config.dart';
import 'package:distance_measurement_app/router/app_router.dart';
import 'package:distance_measurement_app/utils/distance_utils.dart';
import 'package:distance_measurement_app/utils/network_utils.dart';
import 'package:flutter/material.dart';
import 'package:distance_measurement_app/resources/theme/theme_data.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final appState = AppState();
  final menuState = MenuState();
  final settingsState = SettingsState();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: appState),
        ChangeNotifierProvider.value(value: menuState),
        ChangeNotifierProvider.value(value: settingsState),
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
  final _appRouter = AppRouter();
  Timer? timer;
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
    context.read<SettingsState>().loadPrefsThemeMode();
    context.read<SettingsState>().loadPrefsLanguageMode();
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
    return Consumer<SettingsState>(
      builder: (context, provider, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: CustomThemeData.lightThemeData,
          darkTheme: CustomThemeData.darkThemeData,
          themeMode: context.watch<SettingsState>().themeMode,
          routerConfig: _appRouter.config(),
          scaffoldMessengerKey: scaffoldMessengerKey,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('pl'),
          ],
          locale: context.watch<SettingsState>().appLocale,
        );
      }
    );
  }
}
