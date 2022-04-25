// ignore_for_file: prefer_const_constructors, unused_local_variable
import 'dart:math';

import 'package:coinstats/constant.dart';
import 'package:coinstats/models/chart_data_model.dart';
import 'package:coinstats/models/bringcoins_model/data_model.dart';
import 'package:coinstats/provider/app_provider/app_provider.dart';
import 'package:coinstats/views/screans/allcoins_screans.dart';
import 'package:coinstats/views/screans/coin_details_screans.dart';
import 'package:coinstats/views/widgets/coin_chart_widget.dart';
import 'package:coinstats/views/widgets/topcoin_list_card_widgets.dart';
import 'package:coinstats/views/widgets/coin_logochart_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../dialog/dialogsetting_screans.dart';
import 'coin_detail_for_price_in_list_widgets.dart';

class HomeScreansItems extends StatefulWidget {
  final List<DataModel> coins;
  const HomeScreansItems({Key? key, required this.coins}) : super(key: key);
  @override
  State<HomeScreansItems> createState() => _HomeScreansItemsState();
}

class _HomeScreansItemsState extends State<HomeScreansItems> {
  double xOffset = 0;
  double yOffset = 0;
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final appProvider = Provider.of<AppProvider>(context);

    return WillPopScope(
      onWillPop: () async {
        ScaffoldMessenger.of(context);
        return false;
      },
      child: AnimatedContainer(
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(isDrawerOpen ? 0.90 : 1.00)
          ..rotateZ(isDrawerOpen ? pi / 20 : 0),
        duration: Duration(seconds: 200),
        decoration: BoxDecoration(
            borderRadius: isDrawerOpen
                ? BorderRadius.circular(Constans.hightBorderRadius)
                : BorderRadius.circular(0)),
        child: Scaffold(
          appBar: AppBar(
              elevation: 0,
              centerTitle: false,
              leading: Padding(
                  padding: EdgeInsets.only(left: Constans.padding),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.menu,
                        color: grey,
                      ))),
              actions: [
                /*IconButton(
                    onPressed: () {
                      showSearch(
                          context: context,
                          delegate: CoinSearchWidgets(coin: coins));
                    },
                    icon: Icon(
                      Icons.search,
                      color: grey,
                      size: 30,
                    )),
                SizedBox(
                  width: 0,
                ),*/
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
                ),
              ],
              automaticallyImplyLeading: false,
              title: Padding(
                padding: const EdgeInsets.only(left: 0),
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
                      child: widget.coins.isNotEmpty
                          ? ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                var coin = widget.coins[index];

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
                                        builder: (context) => AllCoinsScreans(
                                            coins: widget.coins)));
                              },
                              highlightColor: kwhite,
                              borderRadius: BorderRadius.circular(
                                  Constans.bigBorderRadios),
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
                        child: widget.coins.isNotEmpty
                            ? ListView.builder(
                                shrinkWrap: true,
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  var coin = widget.coins[index];
                                  var coinPrice = coin.quoteModel.usdModel;
                                  var coinname = coin.name;
                                  var data = [
                                    ChartData(
                                        coinPrice.percentChange_90d, 2160),
                                    ChartData(
                                        coinPrice.percentChange_60d, 1440),
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
                                          padding:
                                              const EdgeInsets.only(top: 10),
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
      ),
    );
  }
}
