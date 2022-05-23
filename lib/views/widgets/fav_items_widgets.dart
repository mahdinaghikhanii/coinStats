import 'package:coinstats/views/widgets/nothing_is_here_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../models/bringcoins_model/fetch_coins.dart';
import '../../models/chart_data_model.dart';
import '../../module/constant.dart';
import '../../module/extension.dart';
import '../../repository/hive_for_datamodel.dart';
import '../screans/coin_details_screans.dart';
import 'coin_detail_for_price_in_list_widgets.dart';
import 'coin_logochart_widgets.dart';
import 'widgets.dart';

class FavoriteIteamsWidgets extends StatelessWidget {
  const FavoriteIteamsWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HiveForDataModel>(builder: (context, value, child) {
      context.watch<HiveForDataModel>().getFavorite();
      return Provider.of<HiveForDataModel>(context).lenghFavorite == 0
          ? const NothingIsHereWidgets()
          : SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: ListView.builder(
                  itemCount: value.listFavorite.length,
                  itemBuilder: (context, index) {
                    DataModel fav = value.listFavorite[index];
                    var coinPrice = fav.quoteModel.usdModel;
                    var data = [
                      ChartData(coinPrice.percentChange_90d, 2160),
                      ChartData(coinPrice.percentChange_60d, 1440),
                      ChartData(coinPrice.percentChange_30d, 720),
                      ChartData(coinPrice.percentChange_24h, 24),
                      ChartData(coinPrice.percentChange_1h, 1)
                    ];
                    return GestureDetector(
                      onTap: () {
                        context.nextScreans(CoinDetailsScreans(coin: fav));
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 10),
                            child: Container(
                                height: 70.0,
                                width: context.width,
                                padding: const EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                    color: appProvider.brightness
                                        ? kblack
                                        : kwhite,
                                    borderRadius: BorderRadius.circular(16)),
                                child: Row(
                                  children: [
                                    CoinLogoWidgets(
                                      coin: fav,
                                    ),
                                    CoinChartWidget(
                                      color: kwhite,
                                      data: data,
                                      coinPrice: coinPrice,
                                    ),
                                    CoinDatilForPriceWidgets(
                                        coinPrice: coinPrice),
                                  ],
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 8),
                            child: Row(
                              children: [
                                InkWell(
                                    borderRadius: BorderRadius.circular(
                                        Constans.smallBorderRadios),
                                    onTap: () => context.nextScreans(
                                        CoinDetailsScreans(coin: fav)),
                                    child: Text(
                                      'View details',
                                      style: context.textTheme.bodyText2!
                                          .copyWith(fontSize: 14),
                                    )),
                                const Spacer(),
                                Row(
                                  children: [
                                    InkWell(
                                      borderRadius: BorderRadius.circular(
                                          Constans.smallBorderRadios),
                                      onTap: (() async =>
                                          await Provider.of<HiveForDataModel>(
                                                  context,
                                                  listen: false)
                                              .removeFavorite(fav)),
                                      child: Text(
                                        'Remove FAvorite',
                                        style: context.textTheme.bodyText2!
                                            .copyWith(fontSize: 14),
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: 16,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            indent: Constans.padding,
                            endIndent: Constans.padding,
                            color: grey,
                          )
                        ],
                      ),
                    );
                  }));
    });
  }
}
