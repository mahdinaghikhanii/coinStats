import 'package:coinstats/models/chart_data_model.dart';
import 'package:coinstats/models/data_model.dart';
import 'package:coinstats/theme/constant.dart';
import 'package:coinstats/views/widgets/coin_chart_widget.dart';
import 'package:coinstats/views/widgets/coin_logochart_widgets.dart';
import 'package:flutter/material.dart';

class CoinListWidgets extends StatelessWidget {
  const CoinListWidgets({required this.coins});
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /* Padding(
                  padding: const EdgeInsets.all(Constans.padding),
                  child: Container(
                    width: size.width,
                    height: size.height * 0.26,
                    decoration: BoxDecoration(
                        color: kblue, borderRadius: BorderRadius.circular(30)),
                    child: Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 1,
                          itemBuilder: (context, index) =>
                              const CoinListcarTopWidget()),
                    ),
                  ),
                ),*/
                SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.all(Constans.padding),
                      child: Row(
                        children: [
                          Text(
                            'Charts',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          const Spacer(),
                          Text(
                            'See all',
                            style: Theme.of(context).textTheme.subtitle1,
                          )
                        ],
                      )),
                ),
                Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 90,
                        itemBuilder: (context, index) {
                          var coin = coins[index];
                          var coinPrice = coin.quoteModel.usdModel;
                          var data = [
                            ChartData(
                                value: coinPrice.percentChange_90d, year: 2160),
                            ChartData(
                                value: coinPrice.percentChange_60d, year: 1440),
                            ChartData(
                                value: coinPrice.percentChange_30d, year: 720),
                            ChartData(
                                value: coinPrice.percentChange_24h, year: 24),
                            ChartData(
                                value: coinPrice.percentChange_1h, year: 1)
                          ];
                          print(index);

                          return GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 16),
                              child: Container(
                                  height: 70.0,
                                  width: size.width,
                                  padding: const EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                      color: kwhite,
                                      borderRadius: BorderRadius.circular(16)),
                                  child: Row(
                                    children: [
                                      CoinLogoChartWidgets(
                                        coin: coin,
                                      ),
                                      // ignore: prefer_const_constructors
                                      CoinChartWidget(
                                        color: Colors.red,
                                        data: data,
                                        coinPrice: coinPrice,
                                      )
                                    ],
                                  )),
                            ),
                          );
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
