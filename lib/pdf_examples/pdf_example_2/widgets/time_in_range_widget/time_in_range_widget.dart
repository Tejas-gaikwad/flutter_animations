import 'package:flutter/material.dart';

import 'time_in_range_graph.dart';

// ignore: must_be_immutable
class TimeInRangeGraph extends StatelessWidget {
  TimeInRangeGraph({super.key});

  Color green = const Color(0XFF3d9e72);
  Color red = const Color(0XFFff4e4e);
  Color blue = const Color(0XFF0c69a3);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: 500,
      width: MediaQuery.of(context).size.width / 2,
      child: const TimeInRangeGraphWidget(),
    );
  }
}
