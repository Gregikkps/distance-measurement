import 'package:auto_route/auto_route.dart';
import 'package:distance_measurement_app/provider/settings/settings_state.dart';
import 'package:distance_measurement_app/screens/wifi_info/wifi_info_view.dart';
import 'package:distance_measurement_app/utils/network_utils.dart';
import 'package:flutter/material.dart';

@RoutePage()
class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => InfoScreenState();
}

class InfoScreenState extends State<InfoScreen> {
  @override
  void initState() {
    NetworkUtils().getAllNetworkInfo(context);
    super.initState();
  }

  @override
  void dispose() {
    SettingsState().resetConnectionStatus();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => InfoScreenView(this);
}
