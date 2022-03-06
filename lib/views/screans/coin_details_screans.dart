// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:coinstats/models/bringcoins_model/data_model.dart';
import 'package:flutter/material.dart';

class CoinDetailsScreans extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  CoinDetailsScreans({required this.coin});
  final DataModel coin;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Text(
              coin.name,
              style: textTheme.bodyText1,
            ),
          )
        ],
      ),
    );
  }
}
