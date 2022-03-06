// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:coinstats/models/bringcoins_model/data_model.dart';
import 'package:coinstats/theme/constant.dart';
import 'package:coinstats/util/view_models/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../widgets/condition_button_widgets.dart';

class CoinDetailsScreans extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  CoinDetailsScreans({required this.coin});
  final DataModel coin;
  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    var coinIconUrl =
        "https://raw.githubusercontent.com/spothq/cryptocurrency-icons/master/128/color/";
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ConditionButtonWidgets(time: '1h'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
