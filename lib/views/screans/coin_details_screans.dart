// ignore_for_file: prefer_const_constructors_in_immutables
import 'package:cached_network_image/cached_network_image.dart';
import 'package:coinstats/models/bringcoins_model/data_model.dart';
import 'package:coinstats/theme/constant.dart';
import 'package:coinstats/util/view_models/app_provider.dart';
import 'package:coinstats/views/widgets/coin_detail_about_coin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../models/chart_data_model.dart';
import '../widgets/coin_chart_widget.dart';

class CoinDetailsScreans extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  CoinDetailsScreans({required this.coin});
  final DataModel coin;
  @override
  Widget build(BuildContext context) {
    var coinIconUrl =
        "https://raw.githubusercontent.com/spothq/cryptocurrency-icons/master/128/color/";
    // ignore: unused_local_variable

    final appProvider = Provider.of<AppProvider>(context);
    final textTheme = Theme.of(context).textTheme;
    var coinPrice = coin.quoteModel.usdModel;
    var data = [
      ChartData(coinPrice.percentChange_90d, 2160),
      ChartData(coinPrice.percentChange_60d, 1440),
      ChartData(coinPrice.percentChange_30d, 720),
      ChartData(coinPrice.percentChange_24h, 24),
      ChartData(coinPrice.percentChange_1h, 1)
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        foregroundColor: appProvider.brightness ? kwhite : kblack,
        title: Text(
          coin.name + " / " + "Rank #" + coin.cmcRank.toString(),
          style: textTheme.caption,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 100,
              child: CachedNetworkImage(
                imageUrl: ((coinIconUrl + coin.symbol + ".png").toLowerCase()),
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) =>
                    SvgPicture.asset('assets/icon/dollar.svg'),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
                "\$" +
                    coin.quoteModel.usdModel.price
                        .toStringAsFixed(2)
                        .toString(),
                style: TextStyle(
                    color: appProvider.brightness ? kwhite : kblack,
                    fontSize: 35,
                    fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    coin.quoteModel.usdModel.percentChange_1h >= 0
                        ? arrowupright
                        : arrowdownleft,
                    color: coin.quoteModel.usdModel.percentChange_1h >= 0
                        ? const Color.fromARGB(255, 17, 218, 50)
                        : Colors.red,
                  ),
                  Text(
                      coin.quoteModel.usdModel.percentChange_1h
                              .toStringAsFixed(2) +
                          "%" +
                          "(1h)",
                      style: TextStyle(
                          color: coin.quoteModel.usdModel.percentChange_1h >= 0
                              ? Colors.green
                              : Colors.red,
                          fontSize: 18)),
                ],
              ),
            ),
            CoinChartWidget(
                data: data, coinPrice: coin.quoteModel.usdModel, color: kred),
            const SizedBox(
              height: 25,
            ),
            CoinDetailAboutCoin(
              deetial: "\$" + coin.quoteModel.usdModel.marketCap.toString(),
              name: 'Market cap',
              datachcart: '',
              icon: coin.quoteModel.usdModel.marketCap >= 0
                  ? arrowupright
                  : arrowdownleft,
              iconcolor: coin.quoteModel.usdModel.marketCap >= 0
                  ? Colors.green
                  : Colors.red,
            ),
            CoinDetailAboutCoin(
              deetial: "\$" +
                  coin.quoteModel.usdModel.fullydilutedmarketcap.toString(),
              name: 'Fully diluted marketcap',
              datachcart: '',
              icon: coin.quoteModel.usdModel.marketCap >= 0
                  ? arrowupright
                  : arrowdownleft,
              iconcolor: coin.quoteModel.usdModel.fullydilutedmarketcap >= 0
                  ? Colors.green
                  : Colors.red,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Circulating Supply",
                      style: const TextStyle(fontSize: 15, color: grey)),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        coin.circulatingSupply.toString() + " " + coin.symbol,
                        style: TextStyle(
                            color: appProvider.brightness ? kwhite : kblack,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      const Spacer(),
                      const Icon(Icons.verified, color: grey),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    indent: 2,
                    endIndent: 2,
                    color: kwhite,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
