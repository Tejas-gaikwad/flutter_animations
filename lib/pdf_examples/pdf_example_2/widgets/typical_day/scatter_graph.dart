/// Package import
import 'package:flutter/material.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

/// Renders the default scatter chart sample.
class ScatterDefault extends StatefulWidget {
  ScatterDefault({super.key});

  @override
  State<ScatterDefault> createState() => _ScatterDefaultState();
}

/// State class of default scatter chart sample.
class _ScatterDefaultState extends State<ScatterDefault> {
  List<ChartSampleData>? chartData;

  @override
  Widget build(BuildContext context) {
    return _buildDefaultScatterChart();
  }

  /// Returns the default scatter chart.
  SfCartesianChart _buildDefaultScatterChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      legend: Legend(isVisible: true),
      primaryXAxis: DateTimeAxis(
        labelIntersectAction: AxisLabelIntersectAction.multipleRows,
        interval: 2.0,
      ),
      primaryYAxis: NumericAxis(
          minimum: 70,
          maximum: 130,
          labelFormat: '{value}',
          interval: 10,
          axisLine: const AxisLine(width: 0),
          minorTickLines: const MinorTickLines(size: 0)),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: _getDefaultScatterSeries(),
    );
  }

  @override
  void initState() {
    chartData = [
      ChartSampleData(x: DateTime(2019, 12, 28, 17, 20), yValue: 97.0),
      ChartSampleData(x: DateTime(2019, 12, 28, 17, 35), yValue: 100.0),
      ChartSampleData(x: DateTime(2019, 12, 28, 17, 50), yValue: 101.0),
      ChartSampleData(x: DateTime(2019, 12, 28, 18, 05), yValue: 99.0),
      ChartSampleData(x: DateTime(2019, 12, 28, 18, 20), yValue: 107.0),
      ChartSampleData(x: DateTime(2019, 12, 28, 18, 35), yValue: 108.0),
      ChartSampleData(x: DateTime(2019, 12, 28, 18, 50), yValue: 99.0),
      ChartSampleData(x: DateTime(2019, 12, 28, 19, 05), yValue: 106.0),
      ChartSampleData(x: DateTime(2019, 12, 28, 19, 20), yValue: 97.0),
      ChartSampleData(x: DateTime(2019, 12, 28, 19, 35), yValue: 100.0),
      ChartSampleData(x: DateTime(2019, 12, 28, 19, 50), yValue: 97.0),
      ChartSampleData(x: DateTime(2019, 12, 28, 20, 05), yValue: 93.0),
      ChartSampleData(x: DateTime(2019, 12, 28, 20, 20), yValue: 99.0),
      ChartSampleData(x: DateTime(2019, 12, 28, 20, 35), yValue: 112.0),
      ChartSampleData(x: DateTime(2019, 12, 28, 20, 50), yValue: 114.0),
      ChartSampleData(x: DateTime(2019, 12, 28, 21, 05), yValue: 115.0),
      ChartSampleData(x: DateTime(2019, 12, 28, 21, 20), yValue: 103.0),
      ChartSampleData(x: DateTime(2019, 12, 28, 21, 35), yValue: 98.0),
      ChartSampleData(x: DateTime(2019, 12, 28, 21, 50), yValue: 92.0),
      ChartSampleData(x: DateTime(2019, 12, 28, 22, 05), yValue: 83.0),
      ChartSampleData(x: DateTime(2019, 12, 28, 22, 20), yValue: 84.0),
      ChartSampleData(x: DateTime(2019, 12, 28, 22, 35), yValue: 94.0),
      ChartSampleData(x: DateTime(2019, 12, 28, 22, 50), yValue: 104.0),
      ChartSampleData(x: DateTime(2019, 12, 28, 23, 05), yValue: 113.0),
      ChartSampleData(x: DateTime(2019, 12, 28, 23, 20), yValue: 109.0),
      ChartSampleData(x: DateTime(2019, 12, 28, 23, 35), yValue: 104.0),
      ChartSampleData(x: DateTime(2019, 12, 28, 23, 50), yValue: 96.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 00, 05), yValue: 87.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 00, 20), yValue: 82.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 00, 35), yValue: 87.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 00, 50), yValue: 91.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 01, 05), yValue: 98.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 01, 20), yValue: 105.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 01, 35), yValue: 108.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 01, 50), yValue: 108.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 02, 05), yValue: 102.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 02, 20), yValue: 93.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 02, 35), yValue: 84.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 02, 50), yValue: 81.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 03, 05), yValue: 85.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 03, 20), yValue: 97.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 03, 35), yValue: 105.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 03, 50), yValue: 110.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 04, 05), yValue: 108.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 04, 20), yValue: 101.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 04, 35), yValue: 92.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 04, 50), yValue: 85.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 05, 05), yValue: 86.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 05, 20), yValue: 98.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 05, 35), yValue: 106.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 05, 50), yValue: 109.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 06, 05), yValue: 106.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 06, 20), yValue: 98.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 06, 35), yValue: 88.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 06, 50), yValue: 83.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 07, 05), yValue: 87.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 07, 20), yValue: 98.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 07, 35), yValue: 106.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 07, 50), yValue: 110.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 08, 05), yValue: 108.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 08, 20), yValue: 101.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 08, 35), yValue: 91.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 08, 50), yValue: 84.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 09, 05), yValue: 86.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 09, 20), yValue: 99.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 09, 35), yValue: 107.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 09, 50), yValue: 110.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 10, 05), yValue: 107.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 10, 20), yValue: 99.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 10, 35), yValue: 89.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 10, 50), yValue: 84.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 11, 05), yValue: 90.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 11, 20), yValue: 103.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 11, 35), yValue: 111.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 11, 50), yValue: 114.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 12, 05), yValue: 111.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 12, 20), yValue: 104.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 12, 35), yValue: 93.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 12, 50), yValue: 86.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 13, 05), yValue: 87.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 13, 20), yValue: 99.0),
      ChartSampleData(x: DateTime(2019, 12, 29, 13, 35), yValue: 107.0),
    ];

    super.initState();
  }

  /// Returns the list of chart series
  /// which need to render on the scatter chart.
  List<ScatterSeries<ChartSampleData, DateTime>> _getDefaultScatterSeries() {
    return <ScatterSeries<ChartSampleData, DateTime>>[
      ScatterSeries<ChartSampleData, DateTime>(
        pointColorMapper: (datum, index) {
          var data = datum.yValue ?? 0;

          if (data >= 90 && data <= 100) {
            return Colors.green;
          } else if (data < 90) {
            return Colors.blue;
          }
          return data >= 90 && data <= 100 ? Colors.green : Colors.red;
        },
        dataSource: chartData!,
        xValueMapper: (ChartSampleData sales, _) => sales.x as DateTime,
        yValueMapper: (ChartSampleData sales, _) => sales.yValue,
        name: 'India',
        markerSettings: const MarkerSettings(height: 15, width: 15),
      )
    ];
  }

  @override
  void dispose() {
    chartData!.clear();
    super.dispose();
  }
}

///Chart sample data
class ChartSampleData {
  /// Holds the datapoint values like x, y, etc.,
  ChartSampleData({
    this.x,
    this.y,
    this.xValue,
    this.yValue,
    this.secondSeriesYValue,
    this.thirdSeriesYValue,
    this.pointColor,
    this.size,
    this.text,
    this.open,
    this.close,
    this.low,
    this.high,
    this.volume,
  });

  /// Holds x value of the datapoint
  final dynamic x;

  /// Holds y value of the datapoint
  final num? y;

  /// Holds x value of the datapoint
  final dynamic xValue;

  /// Holds y value of the datapoint
  final num? yValue;

  /// Holds y value of the datapoint(for 2nd series)
  final num? secondSeriesYValue;

  /// Holds y value of the datapoint(for 3nd series)
  final num? thirdSeriesYValue;

  /// Holds point color of the datapoint
  final Color? pointColor;

  /// Holds size of the datapoint
  final num? size;

  /// Holds datalabel/text value mapper of the datapoint
  final String? text;

  /// Holds open value of the datapoint
  final num? open;

  /// Holds close value of the datapoint
  final num? close;

  /// Holds low value of the datapoint
  final num? low;

  /// Holds high value of the datapoint
  final num? high;

  /// Holds open value of the datapoint
  final num? volume;
}
