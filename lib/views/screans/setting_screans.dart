import 'package:coinstats/main.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../module/extension.dart';
import '../widgets/builder_listtile_widgets.dart';

class SettingScreans extends StatelessWidget {
  const SettingScreans({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kblue,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Text('Settings',
            style: context.textTheme.subtitle2!.copyWith(fontSize: 28)),
        leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Constans.padding),
            child: InkWell(
                onTap: (() => Navigator.pop(context)),
                child: const Icon(Icons.arrow_back_ios))),
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: kblue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: context.height * 0.05,
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(
                    Constans.bigBorderRadios,
                  ),
                )),
            child: Padding(
              padding: const EdgeInsets.all(Constans.padding),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  BuilderListTileWidgets(
                    icon: Icons.dark_mode,
                    title: 'DarkMode',
                    val: appProvider.brightness,
                    onChanged: (va) =>
                        appProvider.brightnessChange(va ? true : false),
                    showSwitchButton: true,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const BuilderListTileWidgets(
                    icon: Icons.notifications,
                    title: 'Notfication',
                    showSwitchButton: true,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const BuilderListTileWidgets(
                    icon: Icons.privacy_tip_rounded,
                    title: 'Privacy',
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const BuilderListTileWidgets(
                    icon: Icons.share,
                    title: 'Share with your frinds',
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const BuilderListTileWidgets(
                    icon: Icons.person,
                    title: 'About us',
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const BuilderListTileWidgets(
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
