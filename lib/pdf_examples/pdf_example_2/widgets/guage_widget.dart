import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../pdf_example/widgets/responsive_widget.dart';

// ignore: must_be_immutable
class LinearGuage extends StatelessWidget {
  final double progressvalue;
  LinearGuage({super.key, required this.progressvalue});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: SfLinearGauge(
      maximum: 100 * ResponsiveWidget.getBlockWidth(context),
      showTicks: false,
      showLabels: false,
      animateAxis: false,
      axisTrackStyle: const LinearAxisTrackStyle(
        thickness: 10,
        edgeStyle: LinearEdgeStyle.bothFlat,
        borderWidth: 1,
        borderColor: Colors.transparent,
        color: Colors.transparent,
      ),
      barPointers: <LinearBarPointer>[
        LinearBarPointer(
            value: progressvalue,
            thickness: 10,
            edgeStyle: LinearEdgeStyle.endCurve,
            color: const Color.fromARGB(255, 3, 25, 44)),
      ],
    ));
  }
}
