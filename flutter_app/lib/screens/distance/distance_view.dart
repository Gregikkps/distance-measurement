import 'package:flutter/material.dart';
import 'package:flutter_app/components/black_card.dart';
import 'package:flutter_app/components/custom_appbar.dart';
import 'package:flutter_app/resources/text/app_text.dart';

import 'package:flutter_app/screens/distance/distance.dart';

class DistanceScreenView extends StatefulWidget {
  final DistanceScreenController state;
  const DistanceScreenView(this.state, {super.key});

  @override
  State<DistanceScreenView> createState() => _DistanceScreenViewState();
}

class _DistanceScreenViewState extends State<DistanceScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text(AppText.title),
      ),
      body: Stack(
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.srcOver),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: BlackCard(
                  child: Text(
                    widget.state.isConnected ? AppText.connected : AppText.disconnected,
                  ),
                ),
              ),
              Center(
                child: BlackCard(
                  child: Text(
                    '${AppText.distance}: ${widget.state.distance}',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
