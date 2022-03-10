import 'dart:async';
import 'package:coinstats/models/models.dart';
import 'package:coinstats/util/enum/repository/repository.dart';
import 'package:coinstats/views/widgets/coin_list_widgets.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreans extends StatefulWidget {
  const HomeScreans({Key? key}) : super(key: key);

  @override
  State<HomeScreans> createState() => _HomeScreansState();
}

class _HomeScreansState extends State<HomeScreans> {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  late Future<BigDataModele> _futureCoins;
  late Repository repository;

  @override
  void initState() {
    //this part for check wifi or data mobile
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_UpdateConnectionState);

    // this part for req server and respone for Datamodel
    repository = Repository();
    _futureCoins = repository.getCoins();
    super.initState();
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
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

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print("Error Occurred: ${e.toString()} ");
      return;
    }
    if (!mounted) {
      return Future.value(null);
    }
    return _UpdateConnectionState(result);
  }

  // ignore: non_constant_identifier_names
  Future<void> _UpdateConnectionState(ConnectivityResult result) async {
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      showStatus(result, true);
    } else {
      showStatus(result, false);
    }
  }

  void showStatus(ConnectivityResult result, bool status) {
    final snackBar = SnackBar(
        content:
            Text("${status ? 'ONLINE\n' : 'OFFLINE\n'}${result.toString()} "),
        backgroundColor: status ? Colors.green : Colors.red);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
