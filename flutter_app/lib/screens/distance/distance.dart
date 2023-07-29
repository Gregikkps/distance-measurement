import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:distance_measurement_app/screens/distance/distance_view.dart';

@RoutePage() 
class DistanceScreen extends StatefulWidget {
  const DistanceScreen({super.key});

  @override
  State<DistanceScreen> createState() => DistanceScreenState();
}

class DistanceScreenState extends State<DistanceScreen> {
  @override
  Widget build(BuildContext context) => DistanceScreenView(this);
}
