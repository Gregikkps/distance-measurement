import 'package:auto_route/auto_route.dart';
import 'package:distance_measurement_app/screens/distance/distance.dart';
import 'package:distance_measurement_app/screens/help/help.dart';
import 'package:distance_measurement_app/screens/info/info.dart';
import 'package:distance_measurement_app/screens/menu/menu.dart';
import 'package:distance_measurement_app/screens/settings/settings.dart';
import 'package:flutter/material.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: DistanceRoute.page, path: '/'),
        AutoRoute(page: MenuRoute.page),
        AutoRoute(page: SettingsRoute.page),
        AutoRoute(page: HelpRoute.page),
        AutoRoute(page: InfoRoute.page),
      ];
}
