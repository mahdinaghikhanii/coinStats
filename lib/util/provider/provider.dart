import 'package:coinstats/util/sharedperfancee/themepreference.dart';
import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  ThemePreference themePreference = ThemePreference();

  bool _brightness = false;

  bool get brightness => _brightness;

  void brightnessChange(bool checkbrightness) {
    _brightness = checkbrightness;
    themePreference.setDarkTheme(checkbrightness);
    notifyListeners();
  }
}
