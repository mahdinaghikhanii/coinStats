import 'package:cached_network_image/cached_network_image.dart';
import 'package:coinstats/models/bringcoins_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class CoinLogoWidgets extends StatelessWidget {
  DataModel coin;

  CoinLogoWidgets({
    Key? key,
    required this.coin,
  }) : super(key: key);

  text() {}

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    var coinIconUrl =
        "https://raw.githubusercontent.com/spothq/cryptocurrency-icons/master/128/color/";
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          width: 1,
        ),
        SizedBox(
            height: 60.0,
            width: 60,
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
            const SizedBox(
              height: 10,
            ),
            Text(
              coin.name,
              style: textTheme.headline6,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              coin.symbol,
              style: textTheme.headline4,
            )
          ],
        ),

        /*
        const Spacer(),
        Column(
          children: [
            Text("\$" + coin.quoteModel.usdModel.price.toStringAsFixed(2))
          ],
        )*/
      ],
    );
  }
}
