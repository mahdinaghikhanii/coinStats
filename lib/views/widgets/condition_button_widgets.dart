// ignore_for_file: use_key_in_widget_constructors

import 'package:coinstats/theme/constant.dart';
import 'package:coinstats/provider/app_provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConditionButtonWidgets extends StatelessWidget {
  const ConditionButtonWidgets({required this.time});
  final String time;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // ignore: unused_local_variable
    final appProvider = Provider.of<AppProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: size.width * 0.14,
        height: size.height * 0.04,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: kblue),
        child: Center(
          child: Text(
            time,
            style: const TextStyle(color: kwhite, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
