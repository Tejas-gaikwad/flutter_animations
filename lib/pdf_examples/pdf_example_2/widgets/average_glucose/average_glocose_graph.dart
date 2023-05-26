import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../pdf_example/widgets/responsive_widget.dart';

class AverageGlucoseGraphWidget extends StatelessWidget {
  final progressvalue;
  final Color color;
  const AverageGlucoseGraphWidget(
      {super.key, this.progressvalue = 61.0, required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: SfLinearGauge(
      orientation: LinearGaugeOrientation.vertical,
      maximum: 5.0 * ResponsiveWidget.getBlockWidth(context),
      showTicks: false,
      showLabels: false,
      animateAxis: false,
      axisTrackExtent: 5,
      showAxisTrack: true,
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
            color: color),
      ],
    ));
  }
}
