import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphWidget extends StatefulWidget {
  const GraphWidget({super.key});

  @override
  State<GraphWidget> createState() => _GraphWidgetState();
}

class _GraphWidgetState extends State<GraphWidget> {
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
      ChartSampleData(x: '1', y: 50.2),
      ChartSampleData(x: '2', y: 60.7),
      ChartSampleData(x: '3', y: 90.4),
      ChartSampleData(x: '4', y: 120.7),
      ChartSampleData(x: '5', y: 150.7),
      ChartSampleData(x: '6', y: 170.8),
      ChartSampleData(x: '7', y: 170.0),
      ChartSampleData(x: '8', y: 150.0),
      ChartSampleData(x: '9', y: 110.8),
      ChartSampleData(x: '10', y: 70.8),
      ChartSampleData(x: '11', y: 50.3),
      ChartSampleData(x: '12', y: 50.3),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 300,
        width: MediaQuery.of(context).size.width / 2,
        child: SfCartesianChart(
          plotAreaBorderWidth: 0,
          primaryXAxis:
              CategoryAxis(majorGridLines: const MajorGridLines(width: 0)),
          primaryYAxis: NumericAxis(
              labelFormat: '{value}',
              labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black),
              minimum: 0,
              maximum: 180,
              interval: 20,
              axisLine: const AxisLine(width: 0),
              majorTickLines: const MajorTickLines(color: Colors.transparent)),
          // tooltipBehavior: _tooltipBehavior,
          series: _getPointColorMapperSeries(),
        ),
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
          dataLabelSettings: const DataLabelSettings(isVisible: false),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
          pointColorMapper: (ChartSampleData sales, _) =>
              _getPointColor(sales.y))
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
