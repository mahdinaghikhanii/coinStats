import 'package:cached_network_image/cached_network_image.dart';
import 'package:coinstats/models/bringcoins_model/data_model.dart';
import 'package:coinstats/theme/constant.dart';
import 'package:coinstats/views/screans/coin_details_screans.dart';
import 'package:coinstats/views/widgets/coin_list_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/bringcoins_model/big_data_modele.dart';
import '../../util/enum/repository/repository.dart';

class CoinSearchWidgets extends SearchDelegate<String> {
  CoinSearchWidgets({required this.coin});
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

  Widget build() {
    for (int i = 0; i < coin.length; i++) {
      var myCoin = coin[i];

      if (query != null && myCoin.name.contains(query.toLowerCase())) {
        return ListTile(
          title: Text(query),
        );
      }
    }
    return Text('data');
  }

  Widget buildSuggestionsSuccess() {
    List<String> data = [];
    List<String> nameCoin = [];
    for (int i = 0; i < coin.length; i++) {
      var result = coin[i];
      data.add(result.symbol);
      print(data);
    }
    nameCoin = data;

    listSearch = query.isEmpty
        ? []
        : nameCoin.where(((element) => element.startsWith(query))).toList();

    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var myCoin = coin[index];

        return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CoinDetailsScreans(coin: myCoin)));
            },
            child: ListTile(
                leading: SizedBox(
                  width: 35,
                  child: CachedNetworkImage(
                    imageUrl: ((Constans.coinIconUrl + myCoin.symbol + ".png")
                        .toLowerCase()),
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        SvgPicture.asset('assets/icon/dollar.svg'),
                  ),
                ),
                /* leading: SizedBox(
                    height: 30.0,
                    width: 30,
                    child: CachedNetworkImage(
                      imageUrl: ((Constans.coinIconUrl +
                              listSearch[index].toString() +
                              ".png")
                          .toLowerCase()),
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          SvgPicture.asset('assets/icon/dollar.svg'),
                    )),*/

                title: Text(listSearch[index].toString())));
      },
      itemCount: listSearch.length,
    );
  }
}
