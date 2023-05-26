import 'package:flutter/material.dart';

import '../../pdf_example/widgets/responsive_widget.dart';
import 'guage_widget.dart';

class PerDayAnalysisWidget extends StatelessWidget {
  final List<double> listOfGuages;
  const PerDayAnalysisWidget({super.key, required this.listOfGuages});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.centerLeft,
          children: [
            SizedBox(
                height: (4.0 *
                        listOfGuages.length *
                        ResponsiveWidget.getBlockHeight(context))
                    .toDouble(),
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Align(child: Text(((index + 1) * 20).toString())),
                            Expanded(
                                child: Container(
                                    alignment: Alignment.centerRight,
                                    decoration: BoxDecoration(
                                        border: Border(
                                            right: const BorderSide(
                                                color: Colors.black),
                                            left: index == 0
                                                ? const BorderSide(
                                                    color: Colors.black)
                                                : const BorderSide(
                                                    color:
                                                        Colors.transparent))),
                                    width: 10 *
                                        ResponsiveWidget.getBlockWidth(
                                            context))),
                          ]);
                    })),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: listOfGuages.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 3.0 * ResponsiveWidget.getBlockHeight(context),
                  margin: const EdgeInsets.symmetric(vertical: 1),
                  child: LinearGuage(progressvalue: listOfGuages[index]),
                );
              },
            )
          ],
        ),
      ],
    );
  }
}
