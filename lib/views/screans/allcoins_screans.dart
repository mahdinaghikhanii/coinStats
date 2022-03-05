import 'package:coinstats/main.dart';
import 'package:coinstats/models/bringcoins_model/data_model.dart';
import 'package:coinstats/models/chart_data_model.dart';
import 'package:coinstats/theme/constant.dart';
import 'package:coinstats/views/widgets/coin_chart_widget.dart';
import 'package:coinstats/views/widgets/coin_logochart_widgets.dart';
import 'package:flutter/material.dart';

class AllCoinsScreans extends StatelessWidget {
  const AllCoinsScreans({Key? key, required this.coins}) : super(key: key);
  final List<DataModel> coins;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: Constans.padding),
              child: Icon(
                Icons.settings,
                size: 30,
                color: grey,
              ),
            )
          ],
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(
              'CoinStats',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          )),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: coins.length,
          itemBuilder: (context, index) {
            var coin = coins[index];
            var coinPrice = coin.quoteModel.usdModel;
            var data = [
              ChartData(value: coinPrice.percentChange_90d, year: 2160),
              ChartData(value: coinPrice.percentChange_60d, year: 1440),
              ChartData(value: coinPrice.percentChange_30d, year: 720),
              ChartData(value: coinPrice.percentChange_24h, year: 24),
              ChartData(value: coinPrice.percentChange_1h, year: 1)
            ];
            return GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 16),
                child: Container(
                    height: 70.0,
                    width: size.width,
                    padding: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        color: appProvider.brightness ? kblack : kwhite,
                        borderRadius: BorderRadius.circular(16)),
                    child: Row(
                      children: [
                        CoinLogoWidgets(
                          coin: coin,
                        ),
                        CoinChartWidget(
                          color: appProvider.brightness ? kwhite : kblack,
                          data: data,
                          coinPrice: coinPrice,
                        )
                      ],
                    )),
              ),
            );
          }),
    );
  }
}
