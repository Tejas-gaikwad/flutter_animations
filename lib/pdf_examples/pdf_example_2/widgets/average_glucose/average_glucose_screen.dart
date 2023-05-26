import 'package:flutter/material.dart';

import 'graph.dart';

// ignore: must_be_immutable
class AverageGlucoseScreen extends StatefulWidget {
  AverageGlucoseScreen({super.key});

  @override
  State<AverageGlucoseScreen> createState() => _AverageGlucoseScreenState();
}

class _AverageGlucoseScreenState extends State<AverageGlucoseScreen> {
  Color green = const Color(0XFF3d9e72);

  Color red = const Color(0XFFff4e4e);

  Color blue = const Color(0XFF0c69a3);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RotatedBox(
                quarterTurns: -1,
                child: Text('Glucose Level (mg/dl)'),
              ),
              Container(
                color: Colors.amber,
                margin: const EdgeInsets.only(bottom: 10),
                height: 400,
                width: MediaQuery.of(context).size.width / 2,
                child: const GraphWidget(),
              ),
            ],
          ),
          Positioned(
            bottom: 60,
            left: 10,
            child: Container(
              child: Text('Days of Progresss--->'),
            ),
          ),
        ],
      ),
    );
  }
}
