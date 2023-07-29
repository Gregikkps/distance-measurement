import 'package:auto_route/auto_route.dart';
import 'package:distance_measurement_app/screens/help/help_view.dart';
import 'package:flutter/material.dart';

@RoutePage() 
class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => HelpScreenState();
}

class HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) => HelpScreenView(this);
}
