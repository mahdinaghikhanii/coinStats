import 'package:coinstats/models/models.dart';
import 'package:coinstats/util/enum/repository/repository.dart';
import 'package:coinstats/views/widgets/coin_list_widgets.dart';
import 'package:flutter/material.dart';

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
    repository = Repository();
    _futureCoins = repository.getCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
