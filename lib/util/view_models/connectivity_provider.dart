import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityChangeNotifier extends ChangeNotifier {
  onnectivityChangeNotifier() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      resultHandler(result);
    });
  }

  ConnectivityResult _connectivityResult = ConnectivityResult.none;

  String _pngUrl = "assets/images/internet_check.png";
  String _pageText =
      "Currently connected to no network. Please connect to a wifi network!";

  ConnectivityResult get connectiviry => _connectivityResult;

  String get pngUrl => _pageText;
  String get pageText => _pageText;

  void resultHandler(ConnectivityResult result) {
    _connectivityResult = result;
    if (result == ConnectivityResult.none) {
      _pngUrl = "assets/images/internet_check.png";
      _pageText =
          'Currently connected to no network. Please connect to a wifi network!';
    } else if (result == ConnectivityResult.mobile) {
      _pngUrl = "assets/images/internet_check.png";
      _pageText =
          'Currently connected to a celluar network. Please connect to a wifi network!';
    } else if (result == ConnectivityResult.wifi) {
      _pngUrl = "assets/images/internet_check.png";
      _pageText = 'Connected to a wifi network!';
    }
    notifyListeners();
  }

  void initialLoad() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    resultHandler(connectivityResult);
  }
}
