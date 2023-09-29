import 'package:distance_measurement_app/main.dart';
import 'package:distance_measurement_app/provider/app/app_state.dart';
import 'package:distance_measurement_app/provider/menu/menu_state.dart';
import 'package:distance_measurement_app/provider/settings/settings_state.dart';
import 'package:provider/provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Providers initialization', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AppState>(create: (_) => AppState()),
          ChangeNotifierProvider<MenuState>(create: (_) => MenuState()),
          ChangeNotifierProvider<SettingsState>(create: (_) => SettingsState()),
        ],
        child: const MyApp(),
      ),
    );
  });

  testWidgets('Golden Test Example', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AppState>(create: (_) => AppState()),
          ChangeNotifierProvider<MenuState>(create: (_) => MenuState()),
          ChangeNotifierProvider<SettingsState>(create: (_) => SettingsState()),
        ],
        child: const MyApp(),
      ),
    );

    await expectLater(
      find.byType(MyApp),
      matchesGoldenFile('golden_screen.png'),
    );
  });
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
  //     matchesGoldenFile('golden_example2.png'),
  //   );
  // });
}
