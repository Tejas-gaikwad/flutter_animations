import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TimeInRangeGraphWidget extends StatefulWidget {
  const TimeInRangeGraphWidget({super.key});

  @override
  State<TimeInRangeGraphWidget> createState() => _TimeInRangeGraphWidgetState();
}

class _TimeInRangeGraphWidgetState extends State<TimeInRangeGraphWidget> {
  List<ChartSampleData>? chartData;
  List<double>? yValues;
  late Color greenColor;
  late Color redColor;
  late Color blueColor;

  @override
  void initState() {
    super.initState();
    greenColor = const Color(0XFF3d9e72);
    redColor = const Color(0XFFff4e4e);
    blueColor = const Color(0XFF0c69a3);

    chartData = <ChartSampleData>[
      ChartSampleData(x: 'Week 1', y: 50.2),
      ChartSampleData(x: 'Week 2', y: 60.7),
      ChartSampleData(x: 'Week 3', y: 90.4),
      ChartSampleData(x: 'Week 4', y: 120.7),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 600,
      // width: MediaQuery.of(context).size.width / 2,
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,

        primaryXAxis: CategoryAxis(
            majorGridLines: const MajorGridLines(width: 0),
            arrangeByIndex: true),
        primaryYAxis: NumericAxis(
            minimum: 0,
            maximum: 180,
            interval: 20,
            axisLine: const AxisLine(width: 0),
            isVisible: false,
            majorTickLines: const MajorTickLines(color: Colors.transparent),
            plotBands: [
              // PlotBand(
              //     shouldRenderAboveSeries: true,
              //     isVisible: true,
              //     // provided the same y-value to start and end property in order to render the plotline for that y-value.
              //     start: chartData?.first.y,
              //     end: chartData?.first.y,
              //     borderWidth: 2,
              //     borderColor: Color(0XFF1c2c3b),
              //     // Label text for the reference plot line
              //     text: '${chartData?.first.y.toString()} %',
              //     horizontalTextAlignment: TextAnchor.end,
              //     textStyle: TextStyle(color: Color(0XFF1c2c3b)),
              //     verticalTextPadding: '2%',
              //     // provided dash array to render the line in dashed format.
              //     dashArray: <double>[5, 3]),
              // PlotBand(
              //     shouldRenderAboveSeries: true,
              //     isVisible: true,
              //     // provided the same y-value to start and end property in order to render the plotline for that y-value.
              //     start: chartData?.last.y,
              //     end: chartData?.last.y,
              //     borderWidth: 2,
              //     borderColor: Color(0XFF1c2c3b),
              //     // Label text for the reference plot line
              //     text: '${chartData?.last.y.toString()} %',
              //     horizontalTextAlignment: TextAnchor.end,
              //     textStyle: const TextStyle(color: Color(0XFF1c2c3b)),
              //     verticalTextPadding: '2%',
              //     // provided dash array to render the line in dashed format.
              //     dashArray: <double>[5, 3]),
            ]),
        // tooltipBehavior: _tooltipBehavior,
        series: _getPointColorMapperSeries(),
        // series: <ChartSeries<ChartSampleData, String>>[
        //   LineSeries<ChartSampleData, String>(
        //       // setting name for the first series
        //       name: 'allUsage',
        //       dataSource: chartData!,
        //       xValueMapper: (ChartSampleData data, _) => data.x as String,
        //       yValueMapper: (ChartSampleData data, _) => data.y,
        //       markerSettings: MarkerSettings(isVisible: true)),
        //   LineSeries<ChartSampleData, String>(
        //       // setting name for the second series
        //       name: 'appUsage',
        //       dataSource: chartData!,
        //       xValueMapper: (ChartSampleData data, _) => data.x as String,
        //       yValueMapper: (ChartSampleData data, _) => data.y,
        //       markerSettings: MarkerSettings(isVisible: true))
        // ],
      ),
    );
  }

  /// The method returns column series to chart.
  List<CartesianSeries<ChartSampleData, String>> _getPointColorMapperSeries() {
    return <CartesianSeries<ChartSampleData, String>>[
      ColumnSeries<ChartSampleData, String>(
        dataSource: chartData!,
        xValueMapper: (ChartSampleData sales, _) => sales.x as String,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        dataLabelSettings: const DataLabelSettings(
          isVisible: true,
        ),
        borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(15.0),
            topRight: const Radius.circular(15.0)),
        pointColorMapper: (ChartSampleData sales, _) => _getPointColor(sales.y),
      )
    ];
  }
}

Color? _getPointColor(num? value) {
  Color? color;
  if (value! < 140 && value > 60) {
    color = const Color(0XFF3d9e72);
  } else if (value > 140) {
    color = color = const Color(0XFFff4e4e);
  } else if (value < 60) {
    color = const Color(0XFF0c69a3);
  }
  return color;
}

///Chart sample data
class ChartSampleData {
  /// Holds the datapoint values like x, y, etc.,
  ChartSampleData(
      {this.x,
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
      this.volume});

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
