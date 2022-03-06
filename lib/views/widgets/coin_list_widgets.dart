// ignore_for_file: prefer_const_constructors
import 'package:coinstats/models/chart_data_model.dart';
import 'package:coinstats/models/bringcoins_model/data_model.dart';
import 'package:coinstats/theme/constant.dart';
import 'package:coinstats/util/view_models/app_provider.dart';
import 'package:coinstats/views/dialog/dialogsetting_screans.dart';
import 'package:coinstats/views/screans/allcoins_screans.dart';
import 'package:coinstats/views/screans/coin_details_screans.dart';
import 'package:coinstats/views/widgets/coin_chart_widget.dart';
import 'package:coinstats/views/widgets/topcoin_list_card_widgets.dart';
import 'package:coinstats/views/widgets/coin_logochart_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoinListWidgets extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const CoinListWidgets({required this.coins});
  final List<DataModel> coins;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // ignore: unused_local_variable
    final textTheme = Theme.of(context).textTheme;
    final appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          actions: [
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (
                      context,
                    ) =>
                        const DialogSettingScreans());
              },
              child: Padding(
                padding: EdgeInsets.only(right: Constans.padding),
                child: Icon(
                  Icons.settings,
                  size: 30,
                  color: grey,
                ),
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
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 240,
                  width: size.width,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 3,
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
                          ChartData(value: coinPrice.percentChange_1h, year: 1)
                        ];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CoinDetailsScreans(
                                          coin: coin,
                                        )));
                          },
                          child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 8, bottom: 16),
                              child: Container(
                                height: 200,
                                width: 300,
                                padding: const EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                    color:
                                        appProvider.brightness ? kblue : kblue,
                                    borderRadius: BorderRadius.circular(25)),
                                child: TopCoinListcarTopWidget(
                                  data: data,
                                  coin: coin,
                                  coinPrice: coinPrice,
                                ),
                              )),
                        );
                      }),
                ),
                Padding(
                    padding: const EdgeInsets.all(Constans.padding),
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text('Charts',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AllCoinsScreans(coins: coins)));
                          },
                          highlightColor: kred,
                          borderRadius: BorderRadius.circular(2),
                          child: SizedBox(
                            height: 25,
                            width: 50,
                            child: Text('See all',
                                style: TextStyle(
                                    color:
                                        appProvider.brightness ? kwhite : kblue,
                                    fontSize: 16)),
                          ),
                        )
                      ],
                    )),
                Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 4,
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
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CoinDetailsScreans(
                                            coin: coin,
                                          )));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 16),
                              child: Container(
                                  height: 70.0,
                                  width: size.width,
                                  padding: const EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                      color: appProvider.brightness
                                          ? kblack
                                          : kwhite,
                                      borderRadius: BorderRadius.circular(16)),
                                  child: Row(
                                    children: [
                                      CoinLogoWidgets(
                                        coin: coin,
                                      ),
                                      CoinChartWidget(
                                        color: kwhite,
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
