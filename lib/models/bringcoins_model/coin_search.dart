import 'dart:html';

import 'package:coinstats/models/bringcoins_model/data_model.dart';
import 'package:flutter/material.dart';

class CoinSearch extends SearchDelegate<String> {
  CoinSearch({required this.coin});
  late List<DataModel> coin;

  @override
  List<Widget> buildActions(BuildContext context) =>
      [IconButton(onPressed: () {}, icon: Icon(Icons.clear))];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back));

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.confirmation_num, size: 120),
          const SizedBox(
            height: 30,
          ),
          Text(query)
        ],
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildSuggestionsSuccess();
  }

  Widget buildSuggestionsSuccess() {
    return ListView.builder(
      itemCount: coin.length,
      itemBuilder: (context, index) {
        var coins = coin[index];
        return ListTile(
          leading: Icon(Icons.currency_bitcoin),
          title: Text(coins.symbol),
        );
      },
    );
  }
}
