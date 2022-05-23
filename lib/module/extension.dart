import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

extension ContextExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  TextTheme get textTheme => Theme.of(this).textTheme;
  void nextScreans(child) {
    Navigator.push(this, MaterialPageRoute(builder: (context) => child));
  }

  toastWidget(
    String msg,
    Color? backGroundColor,
    Color? textColor,
    double? fontSize,
  ) {
    Fluttertoast.showToast(
        msg: msg,
        //  toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: backGroundColor,
        textColor: textColor,
        fontSize: 16.0);
  }
}

extension StringExtension on String {}

extension WidgetExtension on Widget {
  Widget get center => Center(child: this);
}
