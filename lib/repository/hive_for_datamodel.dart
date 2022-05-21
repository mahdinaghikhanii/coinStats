import 'package:coinstats/models/bringcoins_model/fetch_coins.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HiveForDataModel with ChangeNotifier {
  List _favoriteList = <DataModel>[];
  List get listFavorite => _favoriteList;

  int _lenghtFavorite = 0;
  Future<void> countFavorite() async {
    var box = await Hive.openBox<DataModel>('da');
    _favoriteList = box.values.toList();
    _lenghtFavorite = _favoriteList.length;
    notifyListeners();
  }

  Future<void> addFavorite(DataModel dataModel) async {
    var box = await Hive.openBox<DataModel>('da');
    box.add(dataModel);
    notifyListeners();
  }

  Future<void> removeFavorite() async {}

  Future<void> getFavorite() async {
    final box = await Hive.openBox<DataModel>('da');
    _favoriteList = box.values.toList();
    notifyListeners();
  }
}
