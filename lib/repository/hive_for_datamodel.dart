import 'package:coinstats/models/bringcoins_model/fetch_coins.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HiveForDataModel with ChangeNotifier {
  List _favoriteList = <DataModel>[];
  List get listFavorite => _favoriteList;

  int _lenghtFavorite = 0;
  int get lenghFavorite => _lenghtFavorite;

  countFavorite() async {
    var box = await Hive.openBox<DataModel>('fa');
    _favoriteList = box.values.toList();
    _lenghtFavorite = _favoriteList.length;
    notifyListeners();
  }

  addFavorite(DataModel dataModel) async {
    var box = await Hive.openBox<DataModel>('fa');
    await box.add(dataModel);
    notifyListeners();
  }

  removeFavorite() async {}

  getFavorite() async {
    final box = await Hive.openBox<DataModel>('fa');
    _favoriteList = box.values.toList();
    notifyListeners();
  }
}
