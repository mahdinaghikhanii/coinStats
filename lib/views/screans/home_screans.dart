import 'dart:async';
import 'package:coinstats/models/models.dart';
import 'package:coinstats/views/widgets/home_items.dart';
import 'package:coinstats/views/widgets/loading_widgets.dart';
import 'package:coinstats/views/widgets/sidebar_widget.dart';
import 'package:flutter/material.dart';
import '../../repository/repository.dart';

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
    return FutureBuilder<BigDataModele>(
        future: _futureCoins,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              var coinsData = snapshot.data!.dataModel;
              return Scaffold(
                  body: Stack(
                children: [
                  const SidBarWidgets(),
                  HomeScreansItems(
                    coins: coinsData,
                  ),
                ],
              ));
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
          }

          return const Center(
            child: LoadingWidgets(),
          );
        });
  }
}
