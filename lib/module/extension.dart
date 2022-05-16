import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension StringExtension on String {}

extension WidgetExtension on Widget {
  Widget get center => Center(child: this);
}
