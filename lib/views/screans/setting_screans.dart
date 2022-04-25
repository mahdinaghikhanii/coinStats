import 'package:coinstats/constant.dart';
import 'package:flutter/material.dart';

import '../widgets/builder_listtile_widgets.dart';

class SettingScreans extends StatelessWidget {
  const SettingScreans({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: false,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Constans.padding),
          child: Text(
            'Settings',
            style: textTheme.subtitle1,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          BuilderListTileWidgets(
            icon: Icons.person,
            title: 'Account',
          )
        ],
      ),
    );
  }
}
