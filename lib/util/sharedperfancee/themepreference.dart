import 'package:shared_preferences/shared_preferences.dart';

class ThemePreference {
  // ignore: constant_identifier_names
  static const THEME_STATUS = 'THEMESTATUS';

  setDarkTheme(bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(THEME_STATUS, value);
  }

  Future<bool> geTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(THEME_STATUS) ?? false;
  }
}
