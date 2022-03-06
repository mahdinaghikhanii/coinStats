import 'package:coinstats/theme/constant.dart';
import 'package:coinstats/util/view_models/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConditionButtonWidgets extends StatelessWidget {
  ConditionButtonWidgets({required this.time});
  final String time;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appProvider = Provider.of<AppProvider>(context);
    return Container(
      width: size.width * 0.2,
      height: size.height * 0.05,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), color: kblue),
      child: Center(
        child: Text(
          time,
          style: const TextStyle(color: kwhite, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
