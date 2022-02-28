import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
  // ignore: constant_identifier_names
  static const THEME_STATUS = 'THEMESTATUS';

  // change the Theme in the provider and SharedPreferences
  bool _brightness = false;

  bool get brightness => _brightness;

  void brightnessChange(bool checkbrightness) {
    _brightness = checkbrightness;
    setDarkTheme(checkbrightness);
    notifyListeners();
  }

  setDarkTheme(bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(THEME_STATUS, value);
  }

  Future<bool> geTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(THEME_STATUS) ?? false;
  }
}
