import 'package:coinstats/theme/constant.dart';
import 'package:coinstats/util/view_models/app_provider.dart';
import 'package:coinstats/views/widgets/card_top_coin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreans extends StatelessWidget {
  const HomeScreans({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final appProvider = Provider.of<AppProvider>(context);
    // ignore: unused_local_variable
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(Constans.padding),
            child: Container(
              width: size.width,
              height: size.height * 0.20,
              decoration: BoxDecoration(
                  color: kblue, borderRadius: BorderRadius.circular(20)),
              child: Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 1,
                    itemBuilder: (context, index) => const CardTopCoin()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
/*
Checkbox(
            onChanged: (bool? value) {
              appProvider.brightnessChange = value!;
            },
            value: appProvider.brightness,
          )
          */
