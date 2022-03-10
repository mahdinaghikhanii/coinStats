import 'dart:async';
import 'package:coinstats/models/models.dart';
import 'package:coinstats/util/enum/repository/repository.dart';
import 'package:coinstats/util/view_models/connectivity_provider.dart';
import 'package:coinstats/views/screans/check_network_screans.dart';
import 'package:coinstats/views/widgets/coin_list_widgets.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreans extends StatefulWidget {
  const HomeScreans({Key? key}) : super(key: key);

  @override
  State<HomeScreans> createState() => _HomeScreansState();
}

class _HomeScreansState extends State<HomeScreans> {
  late Future<BigDataModele> _futureCoins;
  late Repository repository;

  @override
  void initState() {
    //this part for check wifi or data mobile

    // this part for req server and respone for Datamodel
    repository = Repository();
    _futureCoins = repository.getCoins();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<ConnectivityChangeNotifier>(context);
    pro.initialLoad();

    return Consumer<ConnectivityChangeNotifier>(builder: (BuildContext context,
        ConnectivityChangeNotifier connectivityChangeNotifier, Widget? child) {
      return FutureBuilder<BigDataModele>(
        future: _futureCoins,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              var coinsData = snapshot.data!.dataModel;
              return CoinListWidgets(
                coins: coinsData,
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    });
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
