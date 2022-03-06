import 'package:coinstats/models/bringcoins_model/data_model.dart';
import 'package:coinstats/models/bringcoins_model/usd_model.dart';
import 'package:coinstats/models/chart_data_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CoinRandomedChartWidgets extends StatefulWidget {
  const CoinRandomedChartWidgets({
    Key? key,
    required this.coin,
    required this.outputDate,
    required this.data,
  }) : super(key: key);

  final UsdModel coin;
  final String outputDate;
  final List<ChartData> data;

  @override
  State<CoinRandomedChartWidgets> createState() =>
      _CoinRandomedChartWidgetsState();
}

class _CoinRandomedChartWidgetsState extends State<CoinRandomedChartWidgets> {
  @override
  Widget build(BuildContext context) {
    List<bool> _isSelected = [true, false, false, false, false];
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 16.0),
        height: 50.0,
        width: double.infinity,
        child: SfCartesianChart(
          plotAreaBorderWidth: 0,
          primaryXAxis: CategoryAxis(isVisible: false),
          primaryYAxis: CategoryAxis(isVisible: false),
          legend: Legend(isVisible: false),
          tooltipBehavior: TooltipBehavior(enable: false),
          series: <ChartSeries<ChartData, String>>[
            LineSeries<ChartData, String>(
              color:
                  widget.coin.percentChange_7d >= 0 ? Colors.green : Colors.red,
              dataSource: widget.data,
              xValueMapper: (ChartData sales, _) => sales.year.toString(),
              yValueMapper: (ChartData sales, _) => sales.value,
            ),
          ],
        ),
      ),
    );
  }
}
