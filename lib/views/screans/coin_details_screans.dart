// ignore_for_file: prefer_const_constructors_in_immutables
import 'package:coinstats/models/bringcoins_model/data_model.dart';
import 'package:coinstats/theme/constant.dart';
import 'package:coinstats/util/view_models/app_provider.dart';
import 'package:coinstats/views/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoinDetailsScreans extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  CoinDetailsScreans({required this.coin});
  final DataModel coin;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var coinIconUrl =
        "https://raw.githubusercontent.com/spothq/cryptocurrency-icons/master/128/color/";
    var coinPrice = coin.quoteModel.usdModel;

    final appProvider = Provider.of<AppProvider>(context);
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        foregroundColor: appProvider.brightness ? kwhite : kblack,
        title: Text(
          coin.name + " / " + coin.symbol,
          style: textTheme.caption,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            Text(
              "\$" +
                  coin.quoteModel.usdModel.price.toStringAsFixed(2).toString(),
              style: textTheme.subtitle1,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    coin.quoteModel.usdModel.percentChange_7d >= 0
                        ? arrowupright
                        : arrowdownleft,
                    color: coin.quoteModel.usdModel.percentChange_7d >= 0
                        ? const Color.fromARGB(255, 17, 218, 50)
                        : Colors.red,
                  ),
                  Text(
                      coin.quoteModel.usdModel.percentChange_7d
                              .toStringAsFixed(2) +
                          "%",
                      style: TextStyle(
                          color: coin.quoteModel.usdModel.percentChange_7d >= 0
                              ? Colors.green
                              : Colors.red,
                          fontSize: 16)),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
