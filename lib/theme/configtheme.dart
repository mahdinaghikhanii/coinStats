import 'package:coinstats/theme/constant.dart';
import 'package:flutter/material.dart';

class ConfigTheme {
  String faPrimaryFontFamily = "IranYekan";
  late final Color scafoldColor;
  late final Brightness brightness;

  ThemeData getTheme() {
    return ThemeData(
      textTheme: enPrimaryTextTheme,
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

  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.red,
      primaryColor: isDarkTheme ? Colors.black : Colors.white,
      /*  backgroundColor: isDarkTheme ? Colors.black : Color(0xffF1F5FB),
      indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
  
      hintColor: isDarkTheme ? Color(0xff280C0B) : Color(0xffEECED3),
      highlightColor: isDarkTheme ? Color(0xff372901) : Color(0xffFCE192),
      hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),
      focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
      disabledColor: Colors.grey,
    
      cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),*/
    );
  }
}
