import 'package:distance_measurement_app/main.dart';
import 'package:distance_measurement_app/provider/app/app_state.dart';
import 'package:distance_measurement_app/provider/menu/menu_state.dart';
import 'package:distance_measurement_app/provider/settings/settings_state.dart';
import 'package:distance_measurement_app/resources/theme/theme_data.dart';
import 'package:distance_measurement_app/screens/distance/distance.dart';
import 'package:distance_measurement_app/screens/help/help.dart';
import 'package:distance_measurement_app/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  // testWidgets('Providers initialization', (WidgetTester tester) async {
  //   await tester.pumpWidget(
  //     MultiProvider(
  //       providers: [
  //         ChangeNotifierProvider<AppState>(create: (_) => AppState()),
  //         ChangeNotifierProvider<MenuState>(create: (_) => MenuState()),
  //         ChangeNotifierProvider<SettingsState>(create: (_) => SettingsState()),
  //       ],
  //       child: const MyApp(),
  //     ),
  //   );
  // });

  // testWidgets('Golden Test Example', (WidgetTester tester) async {
  //   await tester.pumpWidget(
  //     MultiProvider(
  //       providers: [
  //         ChangeNotifierProvider<AppState>(create: (_) => AppState()),
  //         ChangeNotifierProvider<MenuState>(create: (_) => MenuState()),
  //         ChangeNotifierProvider<SettingsState>(create: (_) => SettingsState()),
  //       ],
  //       child: const MyApp(),
  //     ),
  //   );

  //   await expectLater(
  //     find.byType(MyApp),
  //     matchesGoldenFile('golden_screen.png'),
  //   );
  // });

  testWidgets('Test Home Route', (WidgetTester tester) async {
    await tester.pumpWidget(
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
          home:  HelpScreen(),
        ),
      ),
    );
    // await tester.pumpAndSettle(const Duration(seconds: 5));

    await expectLater(
      find.byType(HelpScreen),
      matchesGoldenFile('distance.png'),
    );
  });
}
