import 'package:cached_network_image/cached_network_image.dart';
import 'package:coinstats/models/data_model.dart';
import 'package:coinstats/theme/constant.dart';
import 'package:coinstats/views/widgets/coin_list_card_widgets.dart';
import 'package:flutter/material.dart';

class CoinListWidgets extends StatelessWidget {
  const CoinListWidgets({required this.coins});
  final List<DataModel> coins;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var coinIconUrl =
        "https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/1200px-Bitcoin.svg.png";

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: Constans.padding),
              child: Icon(
                Icons.settings,
                size: 30,
                color: grey,
              ),
            )
          ],
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(
              'CoinStats',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(Constans.padding),
                  child: Container(
                    width: size.width,
                    height: size.height * 0.26,
                    decoration: BoxDecoration(
                        color: kblue, borderRadius: BorderRadius.circular(30)),
                    child: Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 1,
                          itemBuilder: (context, index) =>
                              const CoinListcarTopWidget()),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(Constans.padding),
                    child: Row(
                      children: [
                        Text(
                          'Charts',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Spacer(),
                        Text(
                          'See all',
                          style: Theme.of(context).textTheme.subtitle1,
                        )
                      ],
                    )),
                Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          var coin = coins[index];
                          print(index);

                          return GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 16),
                              child: Container(
                                height: 75.0,
                                width: size.width,
                                padding: const EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                    color: kwhite,
                                    borderRadius: BorderRadius.circular(16)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 1,
                                        ),
                                        SizedBox(
                                            height: 50.0,
                                            width: 50.0,
                                            child: CachedNetworkImage(
                                              imageUrl: coinIconUrl,
                                              placeholder: (context, url) =>
                                                  const CircularProgressIndicator(),
                                            )),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(coins[index].symbol),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Text(coins[index].slug),
                                          ],
                                        ),
                                        Spacer(),
                                        Column(
                                          children: [
                                            Text("\$" +
                                                coins[index]
                                                    .quoteModel
                                                    .usdModel
                                                    .price
                                                    .toStringAsFixed(2))
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
