import 'package:flutter/material.dart';

import '../../pdf_example/widgets/responsive_widget.dart';
import 'meal_in_per_day_analysis.dart';
import 'per_day_analysis_widget.dart';

class DietCatalogWidget extends StatelessWidget {
  const DietCatalogWidget({super.key});

  static GlobalKey previewContainer1 = new GlobalKey();
  static GlobalKey previewContainer2 = new GlobalKey();
  static GlobalKey previewContainer3 = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    List<double> listOfGuages = [
      84 * ResponsiveWidget.getBlockWidth(context),
      80 * ResponsiveWidget.getBlockWidth(context),
      40 * ResponsiveWidget.getBlockWidth(context),
      84 * ResponsiveWidget.getBlockWidth(context),
      80 * ResponsiveWidget.getBlockWidth(context),
      40 * ResponsiveWidget.getBlockWidth(context),
      84 * ResponsiveWidget.getBlockWidth(context),
      80 * ResponsiveWidget.getBlockWidth(context),
      40 * ResponsiveWidget.getBlockWidth(context),
      84 * ResponsiveWidget.getBlockWidth(context),
      80 * ResponsiveWidget.getBlockWidth(context),
      40 * ResponsiveWidget.getBlockWidth(context),
      84 * ResponsiveWidget.getBlockWidth(context),
      80 * ResponsiveWidget.getBlockWidth(context),
      40 * ResponsiveWidget.getBlockWidth(context),
    ];
    return Column(
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MealsWidgetInPerDayAnalysis(lengthOfWidgets: listOfGuages.length),
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
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     const MealsWidgetInPerDayAnalysis(),
        //     RepaintBoundary(
        //         key: previewContainer2,
        //         child: Container(
        //           margin: const EdgeInsets.symmetric(horizontal: 20.0),
        //           width: MediaQuery.of(context).size.width / 2,
        //           child: const PerDayAnalysisWidget(),
        //         )),
        //   ],
        // ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     const MealsWidgetInPerDayAnalysis(),
        //     RepaintBoundary(
        //         key: previewContainer3,
        //         child: Container(
        //           margin: const EdgeInsets.symmetric(horizontal: 20.0),
        //           width: MediaQuery.of(context).size.width / 2,
        //           child: const PerDayAnalysisWidget(),
        //         )),
        //   ],
        // ),
      ],
    );
  }
}
