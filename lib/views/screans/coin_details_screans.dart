// ignore_for_file: prefer_const_constructors_in_immutables
import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:coinstats/models/bringcoins_model/data_model.dart';
import 'package:coinstats/models/chart_data_model.dart';
import 'package:coinstats/theme/constant.dart';
import 'package:coinstats/util/view_models/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/coin_randomed_chart_widgets.dart';
import '../widgets/condition_button_widgets.dart';

class CoinDetailsScreans extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  CoinDetailsScreans({required this.coin});
  final DataModel coin;
  @override
  Widget build(BuildContext context) {
    Random random = Random();
    int next(int min, int max) => random.nextInt(max - min);

    var coinPrice = coin.quoteModel.usdModel;
    var data = [
      ChartData(next(110, 140), 1),
      ChartData(next(9, 41), 2),
      ChartData(next(140, 200), 3),
      ChartData(coinPrice.percentChange_24h, 4),
      ChartData(coinPrice.percentChange_1h, 5),
      ChartData(next(110, 140), 6),
      ChartData(next(9, 41), 7),
      ChartData(next(140, 200), 8),
      ChartData(coinPrice.percentChange_24h, 9),
      ChartData(coinPrice.percentChange_1h, 10),
      ChartData(next(110, 140), 12),
      ChartData(next(9, 41), 13),
      ChartData(coinPrice.percentChange_1h, 14),
      ChartData(next(9, 41), 15),
      ChartData(next(140, 200), 16),
      ChartData(coinPrice.percentChange_24h, 17),
      ChartData(coinPrice.percentChange_1h, 18),
      ChartData(next(110, 140), 19),
      ChartData(next(9, 41), 20),
      ChartData(next(140, 200), 21),
      ChartData(coinPrice.percentChange_24h, 22),
      ChartData(next(110, 140), 23),
    ];
    final appProvider = Provider.of<AppProvider>(context);
    var coinIconUrl =
        "https://raw.githubusercontent.com/spothq/cryptocurrency-icons/master/128/color/";
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: appProvider.brightness ? kwhite : kblack,
        title: Text(
          coin.name + " / " + coin.symbol,
          style: textTheme.caption,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            Text(
              "\$" +
                  coin.quoteModel.usdModel.price.toStringAsFixed(2).toString(),
              style: textTheme.subtitle1,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    coin.quoteModel.usdModel.percentChange_7d >= 0
                        ? arrowupright
                        : arrowdownleft,
                    color: coin.quoteModel.usdModel.percentChange_7d >= 0
                        ? const Color.fromARGB(255, 17, 218, 50)
                        : Colors.red,
                  ),
                  Text(
                      coin.quoteModel.usdModel.percentChange_7d
                              .toStringAsFixed(2) +
                          "%",
                      style: TextStyle(
                          color: coin.quoteModel.usdModel.percentChange_7d >= 0
                              ? Colors.green
                              : Colors.red,
                          fontSize: 16)),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(Constans.padding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ConditionButtonWidgets(time: '1h'),
                  ConditionButtonWidgets(time: '1d'),
                  ConditionButtonWidgets(time: '1w'),
                  ConditionButtonWidgets(time: '1m'),
                  ConditionButtonWidgets(time: '1y'),
                ],
              ),
            ),
            CoinRandomedChartWidgets(
              coin: coin.quoteModel.usdModel,
              data: data,
              outputDate: '',
            )
          ],
        ),
      ),
    );
  }
}
