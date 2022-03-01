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
        child: Column(
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
            Expanded(
                child: ListView.builder(
                    itemExtent: 160,
                    itemCount: coins.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 16),
                          child: Container(
                            height: 160.0,
                            width: size.width,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: kred,
                                borderRadius: BorderRadius.circular(16)),
                            child: Row(
                              children: [],
                            ),
                          ),
                        ),
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
