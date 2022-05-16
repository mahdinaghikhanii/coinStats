import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../module/extension.dart';
import '../widgets/builder_listtile_widgets.dart';

class SettingScreans extends StatelessWidget {
  const SettingScreans({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblue,
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: context.height * 0.14,
            child: Text(
              'Settings',
              style: context.textTheme.subtitle2!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 36),
            ).center,
          ),
          Expanded(
              child: Container(
            decoration: const BoxDecoration(
                color: kwhite,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      Constans.bigBorderRadios,
                    ),
                    topRight: Radius.circular(Constans.bigBorderRadios))),
            child: Padding(
              padding: const EdgeInsets.all(Constans.padding),
              child: Column(
                children: const [
                  SizedBox(
                    height: 20,
                  ),
                  BuilderListTileWidgets(
                    icon: Icons.notifications,
                    title: 'Help',
                    showSwitchButton: true,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  BuilderListTileWidgets(
                    icon: Icons.privacy_tip_rounded,
                    title: 'Privacy',
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  BuilderListTileWidgets(
                    icon: Icons.share,
                    title: 'Share with your frinds',
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  BuilderListTileWidgets(
                    icon: Icons.person,
                    title: 'About us',
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  BuilderListTileWidgets(
                    icon: Icons.help,
                    title: 'Help',
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
