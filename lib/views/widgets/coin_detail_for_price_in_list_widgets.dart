import 'package:coinstats/models/bringcoins_model/fetch_coins.dart';
import 'package:flutter/material.dart';

class CoinDatilForPriceWidgets extends StatelessWidget {
  const CoinDatilForPriceWidgets({Key? key, required this.coinPrice})
      : super(key: key);
  final UsdModel coinPrice;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "\$" + coinPrice.price.toStringAsFixed(2).toString(),
            style: textTheme.headline6,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(coinPrice.percentChange_1h.toStringAsFixed(2) + "%",
              style: textTheme.headline4),
        ]);
  }
}
