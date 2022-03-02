import 'package:cached_network_image/cached_network_image.dart';
import 'package:coinstats/models/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CoinLogoChartWidgets extends StatelessWidget {
  DataModel coin;
  CoinLogoChartWidgets({required this.coin});

  @override
  Widget build(BuildContext context) {
    var coinIconUrl =
        "https://raw.githubusercontent.com/spothq/cryptocurrency-icons/master/128/color/";
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          width: 1,
        ),
        SizedBox(
            height: 50.0,
            width: 50.0,
            child: CachedNetworkImage(
              imageUrl: ((coinIconUrl + coin.symbol + ".png").toLowerCase()),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) =>
                  SvgPicture.asset('assets/icon/dollar.svg'),
            )),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(coin.symbol),
            const SizedBox(
              height: 4,
            ),
            Text(coin.slug),
          ],
        ),
        const Spacer(),
        Column(
          children: [
            Text("\$" + coin.quoteModel.usdModel.price.toStringAsFixed(2))
          ],
        )
      ],
    );
  }
}
