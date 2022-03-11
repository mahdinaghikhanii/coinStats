import 'package:coinstats/main.dart';
import 'package:coinstats/models/bringcoins_model/data_model.dart';
import 'package:flutter/material.dart';

class CoinSearch extends SearchDelegate<String> {
  CoinSearch({required this.coin});
  List<DataModel> coin;

  var listSearch = [];

  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              query = '';
            },
            icon: const Icon(Icons.clear))
      ];

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
    List<String> mahdi = [];
    List<String> all = [];
    for (int i = 0; i < coin.length; i++) {
      var result = coin[i];
      mahdi.add(result.name);
    }
    all = mahdi;
    print(listSearch);

    listSearch = query.isEmpty
        ? []
        : all.where(((element) => element.startsWith(query))).toList();
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          /*   leading: SizedBox(
            width: 35,
            child: CachedNetworkImage(
              imageUrl: ((Constans.coinIconUrl + coins.symbol + ".png")
                  .toLowerCase()),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) =>
                  SvgPicture.asset('assets/icon/dollar.svg'),
            ),
          ),*/

          title: Text(listSearch[index].toString()),
        );
      },
      itemCount: listSearch.length,
    );
  }
}
