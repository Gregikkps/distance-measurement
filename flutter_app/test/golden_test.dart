import 'package:distance_measurement_app/provider/app/app_state.dart';
import 'package:distance_measurement_app/provider/menu/menu_state.dart';
import 'package:distance_measurement_app/provider/settings/settings_state.dart';
import 'package:distance_measurement_app/resources/theme/theme_data.dart';
import 'package:distance_measurement_app/screens/distance/distance.dart';
import 'package:distance_measurement_app/screens/distance/distance_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'config.dart';

void main() {
  testGoldens('Distance view golden test', (WidgetTester tester) async {
    await loadAppFonts();

    await tester.pumpWidgetBuilder(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AppState>(create: (_) => AppState()),
          ChangeNotifierProvider<MenuState>(create: (_) => MenuState()),
          ChangeNotifierProvider<SettingsState>(create: (_) => SettingsState()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: CustomThemeData.lightThemeData,
          darkTheme: CustomThemeData.darkThemeData,
          themeMode: ThemeMode.dark,
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
          locale: const Locale('en'),
          home: DistanceScreenView(
            DistanceScreenState(),
          ),
        ),
      ),
    );

    await multiScreenGolden(
      tester,
      'distance_view',
      devices: Config.devices,
    );
  });
}
