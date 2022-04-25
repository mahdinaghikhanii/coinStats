import 'package:coinstats/constant.dart';
import 'package:flutter/material.dart';

class BuilderListTileWidgets extends StatelessWidget {
  const BuilderListTileWidgets(
      {Key? key, required this.icon, required this.title})
      : super(key: key);

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: kblack,
      ),
      title: Text(title,
          style: Theme.of(context).textTheme.subtitle1?.copyWith(fontSize: 20)),
    );
  }
}
