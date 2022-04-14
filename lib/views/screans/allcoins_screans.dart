import 'package:coinstats/constant.dart';
import 'package:coinstats/main.dart';
import 'package:coinstats/models/bringcoins_model/data_model.dart';
import 'package:coinstats/models/chart_data_model.dart';
import 'package:coinstats/views/screans/coin_details_screans.dart';
import 'package:coinstats/views/widgets/coin_chart_widget.dart';
import 'package:coinstats/views/widgets/coin_detail_for_price_in_list_widgets.dart';
import 'package:coinstats/views/widgets/coin_logochart_widgets.dart';
import 'package:flutter/material.dart';

import '../dialog/dialogsetting_screans.dart';

class AllCoinsScreans extends StatelessWidget {
  const AllCoinsScreans({Key? key, required this.coins}) : super(key: key);
  final List<DataModel> coins;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                elevation: 0,
                centerTitle: false,
                title: Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text(
                      'CoinStats',
                      style: Theme.of(context).textTheme.subtitle1,
                    )),
                actions: [
                  Padding(
                      padding: const EdgeInsets.only(right: Constans.padding),
                      child: IconButton(
                        icon: const Icon(
                          Icons.settings,
                          size: 30,
                          color: grey,
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (
                                context,
                              ) =>
                                  const DialogSettingScreans());
                        },
                      ))
                ],
              )
            ];
          },
          body: ListView.builder(
              shrinkWrap: true,
              itemCount: coins.length,
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
                                CoinDetailsScreans(coin: coin)));
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 16),
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
                            ),
                            CoinDatilForPriceWidgets(coinPrice: coinPrice)
                          ],
                        )),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
