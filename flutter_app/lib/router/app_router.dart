import 'package:auto_route/auto_route.dart';
import 'package:distance_measurement_app/screens/distance/distance.dart';
import 'package:distance_measurement_app/screens/help/help.dart';
import 'package:distance_measurement_app/screens/home/home.dart';
import 'package:distance_measurement_app/screens/menu/menu.dart';
import 'package:distance_measurement_app/screens/settings/settings.dart';
import 'package:distance_measurement_app/screens/wifi_info/wifi_info.dart';
import 'package:flutter/material.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, path: '/'),
        AutoRoute(page: DistanceRoute.page),
        AutoRoute(page: MenuRoute.page),
        AutoRoute(page: SettingsRoute.page),
        AutoRoute(page: HelpRoute.page),
        AutoRoute(page: WifiInfoRoute.page),
      ];
}
