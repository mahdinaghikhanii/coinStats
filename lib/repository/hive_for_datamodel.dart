import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/bringcoins_model/fetch_coins.dart';

class HiveForDataModel with ChangeNotifier {
  List _favoriteList = <DataModel>[];
  List get listFavorite => _favoriteList;

  bool _btnfav = false;
  get btnFav => _btnfav;

  int _lenghtFavorite = 0;
  int get lenghFavorite => _lenghtFavorite;

  countFavorite() async {
    var box = await Hive.openBox<DataModel>('fa');
    _favoriteList = box.values.toList();
    _lenghtFavorite = _favoriteList.length;
    notifyListeners();
  }

  addFavorite(DataModel dataModel, context) async {
    var box = await Hive.openBox<DataModel>('fa');
    //await box.add(dataModel);
    if (box.containsKey(dataModel.id)) {
      box.delete(dataModel.id);

      _btnfav = false;
    } else {
      _btnfav = true;

      box.put(dataModel.id, dataModel);
    }
    notifyListeners();
  }

  removeFavorite(DataModel dataModel) async {
    final box = await Hive.openBox<DataModel>('fa');
    await box.delete(dataModel.id);

    await getFavorite();
    notifyListeners();
  }

  updateFavorite(int index, DataModel dataModel) async {
    final box = Hive.box<DataModel>('fa');
    box.putAt(dataModel.id, dataModel);
    notifyListeners();
  }

  getFavorite() async {
    final box = await Hive.openBox<DataModel>('fa');
    _favoriteList = box.values.toList();

    notifyListeners();
  }
}
