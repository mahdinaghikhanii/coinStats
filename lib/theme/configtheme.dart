import 'package:coinstats/theme/constant.dart';
import 'package:flutter/material.dart';

class ConfigTheme {
  String faPrimaryFontFamily = "IranYekan";
  late final Color scafoldColor;
  late final Brightness brightness;

  ConfigTheme.light() {
    return;
  }

  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      textTheme: const TextTheme(
          headline4: TextStyle(fontSize: 14, color: Colors.grey),
          headline6: TextStyle(
              fontSize: 14, color: kblack, fontWeight: FontWeight.bold),
          bodyText1: TextStyle(fontSize: 16, color: Colors.grey),
          subtitle1: TextStyle(
              color: kblack, fontSize: 24, fontWeight: FontWeight.bold),
          subtitle2: TextStyle(
              color: kwhite, fontWeight: FontWeight.bold, fontSize: 18),
          button: TextStyle(color: kwhite, fontSize: Constans.fontButtonSisze),
          caption: TextStyle(fontSize: 20, color: grey),
          headlineLarge: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: korange),
          headline5: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: kblack)),
      primaryColor: isDarkTheme ? Colors.black : kwhite,
      backgroundColor: isDarkTheme ? Colors.black : kwhite,
      scaffoldBackgroundColor: kwhite,
      indicatorColor:
          isDarkTheme ? const Color(0xff0E1D36) : const Color(0xffCBDCF8),
      hintColor:
          isDarkTheme ? const Color(0xff280C0B) : const Color(0xffEECED3),
      highlightColor:
          isDarkTheme ? const Color(0xff372901) : const Color(0xffFCE192),
      hoverColor:
          isDarkTheme ? const Color(0xff3A3A3B) : const Color(0xff4285F4),
      focusColor:
          isDarkTheme ? const Color(0xff0B2512) : const Color(0xffA8DAB5),
      appBarTheme: AppBarTheme(backgroundColor: isDarkTheme ? kblack : kwhite),
      disabledColor: Colors.grey,
      cardColor: isDarkTheme ? const Color(0xFF151515) : Colors.white,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme
              ? const ColorScheme.dark()
              : const ColorScheme.light()),
    );
  }

  TextTheme get enPrimaryTextTheme => const TextTheme(
      button: TextStyle(color: kwhite, fontSize: Constans.fontButtonSisze),
      bodyText1: TextStyle(fontSize: 14, color: grey),
      headline6:
          TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: kblack),
      headline5:
          TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: korange));

  TextTheme get faPrimaryTextTheme => const TextTheme();
}
