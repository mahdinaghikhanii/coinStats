// ignore_for_file: prefer_const_constructors, unused_local_variable

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
        return true;
      },
      child: AnimatedContainer(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: grey.withOpacity(0.8),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          border: isDrawerOpen
              ? Border.all(
                  color: grey,
                  width: 3.0,
                )
              : null,
          borderRadius: isDrawerOpen
              ? BorderRadius.circular(Constans.hightBorderRadius)
              : BorderRadius.circular(0),
          color: kwhite,
        ),
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(isDrawerOpen ? 0.80 : 1.00),
        //..rotateZ(isDrawerOpen ? pi / 20 : 0),
        duration: Duration(
          milliseconds: 200,
        ),

        child: GestureDetector(
          onTap: () {
            if (isDrawerOpen == true) {
              setState(() {
                xOffset = 0;
                yOffset = 0;
                isDrawerOpen = false;
              });
            }
          },
          child: Scaffold(
            appBar: AppBar(
                elevation: 0,
                centerTitle: false,
                leading: Padding(
                    padding: EdgeInsets.only(left: Constans.padding),
                    child: IconButton(
                        onPressed: () {
                          if (isDrawerOpen) {
                            setState(() {
                              xOffset = 0;
                              yOffset = 0;
                              isDrawerOpen = false;
                            });
                          } else {
                            setState(() {
                              xOffset = size.width - 120;
                              yOffset = size.height / 5;
                              isDrawerOpen = true;
                            });
                          }
                        },
                        icon: Icon(
                          Icons.menu,
                          color: grey,
                        ))),
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
                                      if (isDrawerOpen == true) {
                                        setState(() {
                                          xOffset = 0;
                                          yOffset = 0;
                                          isDrawerOpen = false;
                                        });
                                      } else {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CoinDetailsScreans(
                                                      coin: coin,
                                                    )));
                                      }
                                    },
                                    child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 8, bottom: 16),
                                        child: Container(
                                          height: 200,
                                          width: 300,
                                          padding:
                                              const EdgeInsets.only(top: 10),
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
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
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
                                      ChartData(
                                          coinPrice.percentChange_30d, 720),
                                      ChartData(
                                          coinPrice.percentChange_24h, 24),
                                      ChartData(coinPrice.percentChange_1h, 1)
                                    ];
                                    return GestureDetector(
                                      onTap: () {
                                        if (isDrawerOpen == true) {
                                          setState(() {
                                            xOffset = 0;
                                            yOffset = 0;
                                            isDrawerOpen = false;
                                          });
                                        } else {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CoinDetailsScreans(
                                                        coin: coin,
                                                      )));
                                        }
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
      ),
    );
  }
}
