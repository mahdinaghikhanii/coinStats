import 'package:coinstats/models/chart_data_model.dart';
import 'package:coinstats/models/bringcoins_model/usd_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CoinChartWidget extends StatelessWidget {
  const CoinChartWidget({
    Key? key,
    required this.data,
    required this.coinPrice,
    required this.color,
  }) : super(key: key);

  final List<ChartData> data;

  final UsdModel coinPrice;
  final Color color;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final textTheme = Theme.of(context).textTheme;
    return Expanded(
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Expanded(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0),
          height: 96.0,
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
                    coinPrice.percentChange_7d >= 0 ? Colors.green : Colors.red,
                dataSource: data,
                xValueMapper: (ChartData sales, _) => sales.year.toString(),
                yValueMapper: (ChartData sales, _) => sales.value,
              ),
            ],
          ),
        ),
      ),
    ]));
  }
}
