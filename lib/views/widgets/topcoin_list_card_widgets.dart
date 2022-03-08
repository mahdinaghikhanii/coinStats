import 'package:cached_network_image/cached_network_image.dart';
import 'package:coinstats/models/chart_data_model.dart';
import 'package:coinstats/models/bringcoins_model/data_model.dart';
import 'package:coinstats/theme/constant.dart';
import 'package:coinstats/views/widgets/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/bringcoins_model/usd_model.dart';

// ignore: must_be_immutable
class TopCoinListcarTopWidget extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const TopCoinListcarTopWidget(
      {required this.coin, required this.coinPrice, required this.data});

  final DataModel coin;
  final UsdModel coinPrice;
  final List<ChartData> data;

  /* CardTopCoin(
      {required this.image, required this.nameCoin, required this.price});
  final String image;
  final String nameCoin;
  final int price;*/

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    // ignore: unused_local_variable
    final size = MediaQuery.of(context).size;
    var coinIconUrl =
        "https://raw.githubusercontent.com/spothq/cryptocurrency-icons/master/128/color/";
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  height: 40.0,
                  width: 40.0,
                  child: CachedNetworkImage(
                    imageUrl:
                        ((coinIconUrl + coin.symbol + ".png").toLowerCase()),
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        SvgPicture.asset('assets/icon/dollar.svg'),
                  )),
              const SizedBox(
                width: 10,
              ),
              Text(
                coin.name,
                style: textTheme.subtitle2,
              ),
              const Spacer(),
              Icon(
                coinPrice.percentChange_1h >= 0 ? arrowupright : arrowdownleft,
                color: coinPrice.percentChange_1h >= 0
                    ? const Color.fromARGB(255, 17, 218, 50)
                    : Colors.red,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                coinPrice.percentChange_1h.toStringAsFixed(2) + "%",
                style: TextStyle(
                    color: coinPrice.percentChange_1h >= 0
                        ? const Color.fromARGB(255, 17, 218, 50)
                        : Colors.red,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              "\$" +
                  coin.quoteModel.usdModel.price.toStringAsFixed(2).toString(),
              style: textTheme.subtitle2,
            ),
          ),
          Test(
            data: data,
            coinPrice: coinPrice,
            color: coinPrice.percentChange_1h >= 0
                ? const Color.fromARGB(255, 17, 218, 50)
                : Colors.red,
          )
        ],
      ),
    );
  }
}
