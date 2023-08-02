import 'package:auto_route/auto_route.dart';
import 'package:distance_measurement_app/screens/home/home_view.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) => HomeScreenView(this);
}
