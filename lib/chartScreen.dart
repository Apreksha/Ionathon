import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  _ChartState createState() => _ChartState();
}
class _ChartState extends State<Chart> {

  final _tooltipBehavior = TooltipBehavior(enable: true);
  List<GDPData> chartData = [
    GDPData('English', 50),
    GDPData('French', 75),
    GDPData('Maths', 25),
    GDPData('Science', 50),
    GDPData('Social Science', 25),
  ];
  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      tooltipBehavior: _tooltipBehavior,
      series: <CircularSeries>[
        PieSeries<GDPData, String>(
          dataSource: chartData,
          xValueMapper: (GDPData data, _) => data.continent,
          yValueMapper: (GDPData data, _) => data.gdp,
          dataLabelSettings: DataLabelSettings(isVisible: true),
          enableTooltip: true,)
      ],
      legend:
      Legend(isVisible: true,
          overflowMode: LegendItemOverflowMode.wrap,position: LegendPosition.left),
    );
  }
}
class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}