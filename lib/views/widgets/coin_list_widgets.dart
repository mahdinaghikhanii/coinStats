// ignore_for_file: prefer_const_constructors, unused_local_variable
import 'package:coinstats/constant.dart';
import 'package:coinstats/views/widgets/coin_search_widgets.dart';
import 'package:coinstats/models/chart_data_model.dart';
import 'package:coinstats/models/bringcoins_model/data_model.dart';
import 'package:coinstats/provider/app_provider/app_provider.dart';
import 'package:coinstats/views/dialog/dialogsetting_screans.dart';
import 'package:coinstats/views/screans/allcoins_screans.dart';
import 'package:coinstats/views/screans/coin_details_screans.dart';
import 'package:coinstats/views/widgets/coin_chart_widget.dart';
import 'package:coinstats/views/widgets/topcoin_list_card_widgets.dart';
import 'package:coinstats/views/widgets/coin_logochart_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'coin_detail_for_price_in_list_widgets.dart';

class CoinListWidgets extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const CoinListWidgets({required this.coins});
  final List<DataModel> coins;

  @override
  // ignore: duplicate_ignore
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final textTheme = Theme.of(context).textTheme;
    final appProvider = Provider.of<AppProvider>(context);

    return WillPopScope(
      onWillPop: () async {
        ScaffoldMessenger.of(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
            elevation: 0,
            centerTitle: false,
            actions: [
              IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (
                        context,
                      ) =>
                          const DialogSettingScreans());
                },
                icon: Icon(
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
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 240,
                    width: size.width,
                    child: coins.isNotEmpty
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              var coin = coins[index];

                              var coinPrice = coin.quoteModel.usdModel;

                              var data = [
                                ChartData(coinPrice.percentChange_90d, 2160),
                                ChartData(coinPrice.percentChange_60d, 1440),
                                ChartData(coinPrice.percentChange_30d, 720),
                                ChartData(coinPrice.percentChange_24h, 24),
                                ChartData(coinPrice.percentChange_1h, 1)
                              ];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CoinDetailsScreans(
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
                                          color: appProvider.brightness
                                              ? kblue
                                              : kblue,
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: TopCoinListcarTopWidget(
                                        data: data,
                                        coin: coin,
                                        coinPrice: coinPrice,
                                      ),
                                    )),
                              );
                            })
                        : Center(
                            child: CircularProgressIndicator(),
                          ),
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
                            child: Center(
                              child: SizedBox(
                                height: 30,
                                width: 60,
                                child: Text('See all',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: appProvider.brightness
                                            ? kwhite
                                            : kblue,
                                        fontSize: 16)),
                              ),
                            ),
                          )
                        ],
                      )),
                  Expanded(
                      child: coins.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                var coin = coins[index];
                                var coinPrice = coin.quoteModel.usdModel;
                                var coinname = coin.name;
                                var data = [
                                  ChartData(coinPrice.percentChange_90d, 2160),
                                  ChartData(coinPrice.percentChange_60d, 1440),
                                  ChartData(coinPrice.percentChange_30d, 720),
                                  ChartData(coinPrice.percentChange_24h, 24),
                                  ChartData(coinPrice.percentChange_1h, 1)
                                ];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CoinDetailsScreans(
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
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        child: Row(
                                          children: [
                                            CoinLogoWidgets(
                                              coin: coin,
                                            ),
                                            CoinChartWidget(
                                              color: kwhite,
                                              data: data,
                                              coinPrice: coinPrice,
                                            ),
                                            CoinDatilForPriceWidgets(
                                                coinPrice: coinPrice),
                                          ],
                                        )),
                                  ),
                                );
                              })
                          : Center(
                              child: CircularProgressIndicator(),
                            )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
