import 'package:flutter/material.dart';
import 'package:distance_measurement_app/screens/distance/distance_view.dart';

class DistanceScreen extends StatefulWidget {
  const DistanceScreen({super.key});

  @override
  State<DistanceScreen> createState() => DistanceScreenState();
}

class DistanceScreenState extends State<DistanceScreen> {
  @override
  Widget build(BuildContext context) => DistanceScreenView(this);
}
