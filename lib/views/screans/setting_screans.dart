import 'package:coinstats/constant.dart';
import 'package:flutter/material.dart';

import '../widgets/builder_listtile_widgets.dart';

class SettingScreans extends StatelessWidget {
  const SettingScreans({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: kblue,
              child: Text(),
            ),
            const BuilderListTileWidgets(
              icon: Icons.person,
              title: 'Account',
            )
          ],
        ),
      ),
    );
  }
}
