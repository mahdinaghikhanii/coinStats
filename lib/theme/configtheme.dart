import 'package:flutter/material.dart';

class ConfigTheme {
  String faPrimaryFontFamily = "IranYekan";
  late final Color scafoldColor;
  late final Brightness brightness;

  ThemeData getTheme(String languageCode) {
    return ThemeData(
      brightness: Brightness.dark,
      textTheme: languageCode == 'en' ? enPrimaryTextTheme : faPrimaryTextTheme,
    );
  }

  TextTheme get enPrimaryTextTheme => const TextTheme();

  TextTheme get faPrimaryTextTheme => const TextTheme();
}
