// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../pdf_example/widgets/responsive_widget.dart';

class MealsWidgetInPerDayAnalysis extends StatefulWidget {
  final int lengthOfWidgets;
  const MealsWidgetInPerDayAnalysis({
    Key? key,
    required this.lengthOfWidgets,
  }) : super(key: key);

  @override
  State<MealsWidgetInPerDayAnalysis> createState() =>
      _MealsWidgetInPerDayAnalysisState();
}

class _MealsWidgetInPerDayAnalysisState
    extends State<MealsWidgetInPerDayAnalysis> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.lengthOfWidgets,
          (index) => text_andCircularValue(context, Color(0XFFff4e4e))),
    );
  }

  Widget text_andCircularValue(
    BuildContext context,
    Color color,
  ) {
    return SizedBox(
      height: 3.2 * ResponsiveWidget.getBlockHeight(context),
      child: Row(
        children: [
          const Text(
            'Onion Salad, Paratha, Chhach',
            style: TextStyle(
                fontSize: 08,
                fontWeight: FontWeight.w500,
                color: Color(0XFF1c2c3b)),
          ),
          const SizedBox(width: 10),
          circularNumberWidget(color),
        ],
      ),
    );
  }

  Widget circularNumberWidget(
    Color color,
  ) {
    return Container(
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: color, width: 2.0)),
        child: Text('10',
            style: TextStyle(
                fontSize: 6, color: color, fontWeight: FontWeight.bold)));
  }
}
