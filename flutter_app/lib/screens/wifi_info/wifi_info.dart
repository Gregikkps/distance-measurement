import 'package:auto_route/auto_route.dart';
import 'package:distance_measurement_app/provider/settings/settings_state.dart';
import 'package:distance_measurement_app/screens/wifi_info/wifi_info_view.dart';
import 'package:distance_measurement_app/utils/network_utils.dart';
import 'package:flutter/material.dart';

@RoutePage()
class WifiInfoScreen extends StatefulWidget {
  const WifiInfoScreen({super.key});

  @override
  State<WifiInfoScreen> createState() => WifiInfoScreenState();
}

class WifiInfoScreenState extends State<WifiInfoScreen> {
  @override
  void didChangeDependencies() {
    NetworkUtils().getAllNetworkInfo(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    SettingsState().resetConnectionStatus();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => WifiInfoScreenView(this);
}
