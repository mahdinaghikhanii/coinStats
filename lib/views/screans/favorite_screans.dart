import 'package:coinstats/module/constant.dart';
import 'package:coinstats/main.dart';
import 'package:coinstats/module/extension.dart';
import 'package:flutter/material.dart';

class FavoriteScreans extends StatelessWidget {
  const FavoriteScreans({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: kblack,
            )),
        centerTitle: false,
        title: Text(
          'Favorite',
          style: context.textTheme.subtitle1,
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  /*  var coin = widget.coins[index];
                  var coinPrice = coin.quoteModel.usdModel;
                  var coinname = coin.name;
                  var data = [
                    ChartData(coinPrice.percentChange_90d, 2160),
                    ChartData(coinPrice.percentChange_60d, 1440),
                    ChartData(coinPrice.percentChange_30d, 720),
                    ChartData(coinPrice.percentChange_24h, 24),
                    ChartData(coinPrice.percentChange_1h, 1)
                  ];*/
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
                              color: appProvider.brightness ? kblack : kwhite,
                              borderRadius: BorderRadius.circular(16)),
                          child: Row(
                              /*     children: [
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
                                            ],*/
                              )),
                    ),
                  );
                })),
      ),
    );
  }
}
