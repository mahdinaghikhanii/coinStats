import 'package:coinstats/models/bringcoins_model/data_model.dart';
import 'package:coinstats/models/bringcoins_model/usd_model.dart';
import 'package:coinstats/models/chart_data_model.dart';
import 'package:coinstats/views/widgets/coin_chart_widget.dart';
import 'package:coinstats/views/widgets/condition_button_widgets.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CoinRandomedChartWidgets extends StatefulWidget {
  const CoinRandomedChartWidgets({required this.coin});
  final DataModel coin;

  @override
  State<CoinRandomedChartWidgets> createState() =>
      _CoinRandomedChartWidgetsState();
}

class _CoinRandomedChartWidgetsState extends State<CoinRandomedChartWidgets> {
  final List<bool> _isSelected = [true, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    var data = []
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: Column(
          children: [
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
                          widget.coin.quoteModel.usdModel.percentChange_7d >= 0
                              ? Colors.green
                              : Colors.red,
                      dataSource: data,
                      xValueMapper: (ChartData sales, _) =>
                          sales.year.toString(),
                      yValueMapper: (ChartData sales, _) => sales.value,
                    ),
                  ],
                ),
              ),
            ),
            ToggleButtons(
              borderRadius: BorderRadius.circular(8.0),
              borderColor: Colors.indigoAccent,
              color: Colors.white,
              selectedColor: Colors.white,
              selectedBorderColor: Colors.indigoAccent,
              children: [
                ConditionButtonWidgets(time: 'Today'),
                ConditionButtonWidgets(time: '1w'),
                ConditionButtonWidgets(time: '1w'),
                ConditionButtonWidgets(time: '1m'),
                ConditionButtonWidgets(time: '1y'),
              ],
              isSelected: _isSelected,
            ),
            const SizedBox(height: 8.0)
          ],
        ),
      ),
    );
  }
}
