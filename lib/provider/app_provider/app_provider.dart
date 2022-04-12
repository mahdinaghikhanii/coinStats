import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum themdata { dark, light }

class AppProvider extends ChangeNotifier {
  var theme = ThemeData.light;
  // ignore: constant_identifier_names
  static const THEME_STATUS = 'THEMESTATUS';

  // change the Theme in the provider and SharedPreferences
  bool _brightness = false;

  bool get brightness => _brightness;

  set brightnessChange(bool checkbrightness) {
    _brightness = checkbrightness;
    setDarkThemeOrLightTheme(checkbrightness);
    notifyListeners();
  }

  setDarkThemeOrLightTheme(bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(THEME_STATUS, value);
  }

  getDarkThemeOrLightTeam() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getBool(THEME_STATUS) == null) {
      _brightness = false;
    } else {
      _brightness = preferences.getBool(THEME_STATUS) ?? false;
    }
  }
}
