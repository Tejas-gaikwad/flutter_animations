import 'package:flutter/material.dart';

import '../../../pdf_example/widgets/responsive_widget.dart';
import '../meal_in_per_day_analysis.dart';
import '../per_day_analysis_widget.dart';

class PerDayAnalysis extends StatelessWidget {
  const PerDayAnalysis({super.key});

  static GlobalKey previewContainer1 = new GlobalKey();
  static GlobalKey previewContainer2 = new GlobalKey();
  static GlobalKey previewContainer3 = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    List<double> listOfGuages = [
      84 * ResponsiveWidget.getBlockWidth(context),
      80 * ResponsiveWidget.getBlockWidth(context),
      40 * ResponsiveWidget.getBlockWidth(context),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Meals',
                style: TextStyle(
                    fontSize: 1.0 * ResponsiveWidget.getTextMultiplier(context),
                    fontWeight: FontWeight.w700,
                    color: const Color(0XFF1c2c3b))),
            Text('DietScore',
                style: TextStyle(
                    fontSize: 1.0 * ResponsiveWidget.getTextMultiplier(context),
                    fontWeight: FontWeight.w700,
                    color: const Color(0XFF1c2c3b))),
          ],
        ),
        SizedBox(height: 2.0 * ResponsiveWidget.getBlockHeight(context)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Transform.rotate(
                angle: -1.6,
                child: const Text(
                  'Morning',
                  style: TextStyle(
                      color: Color(0XFF4c8db5),
                      fontSize: 10,
                      fontWeight: FontWeight.w700),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const MealsWidgetInPerDayAnalysis(lengthOfWidgets: 3),
                RepaintBoundary(
                    key: previewContainer1,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      width: MediaQuery.of(context).size.width / 2,
                      child: PerDayAnalysisWidget(
                        listOfGuages: listOfGuages,
                      ),
                    )),
              ],
            ),
          ],
        ),
        SizedBox(height: 4.5 * ResponsiveWidget.getBlockHeight(context)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Transform.rotate(
                angle: -1.6,
                child: const Text(
                  'Afternoon',
                  style: TextStyle(
                      color: Color(0XFF4c8db5),
                      fontSize: 10,
                      fontWeight: FontWeight.w700),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const MealsWidgetInPerDayAnalysis(lengthOfWidgets: 3),
                RepaintBoundary(
                    key: previewContainer2,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      width: MediaQuery.of(context).size.width / 2,
                      child: PerDayAnalysisWidget(
                        listOfGuages: listOfGuages,
                      ),
                    )),
              ],
            ),
          ],
        ),
        SizedBox(height: 4.5 * ResponsiveWidget.getBlockHeight(context)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Transform.rotate(
                angle: -1.6,
                child: const Text(
                  'Evenning',
                  style: TextStyle(
                      color: Color(0XFF4c8db5),
                      fontSize: 10,
                      fontWeight: FontWeight.w700),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const MealsWidgetInPerDayAnalysis(lengthOfWidgets: 3),
                RepaintBoundary(
                    key: previewContainer3,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      width: MediaQuery.of(context).size.width / 2,
                      child: PerDayAnalysisWidget(
                        listOfGuages: listOfGuages,
                      ),
                    )),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
