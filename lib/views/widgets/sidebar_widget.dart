import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../module/constant.dart';
import '../../module/extension.dart';
import '../screans/favorite_screans.dart';
import '../screans/help/home_help.dart';
import '../screans/setting_screans.dart';
import 'textbuilder_widgets.dart';

class SidBarWidgets extends StatelessWidget {
  const SidBarWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      color: kblue,
      child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 40, bottom: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(0),
                  width: 90,
                  height: 90,
                  child: CircleAvatar(
                    backgroundColor: kgerey300,
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/on1.jpg",
                        width: 85,
                        fit: BoxFit.fill,
                        height: 85,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CoinState',
                      style: textTheme.subtitle2
                          ?.copyWith(fontSize: 18, fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                )
              ],
            ),
            Column(
              children: [
                TextBuilderWidgets(
                  icon: Icons.settings,
                  text: "Settings",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingScreans()));
                  },
                ),
                TextBuilderWidgets(
                  icon: Icons.favorite,
                  text: "Favorites",
                  onTap: () {
                    context.nextScreans(const FavoriteScreans());
                  },
                ),
                TextBuilderWidgets(
                  icon: Icons.help,
                  text: "Help",
                  onTap: () {
                    context.nextScreans(const HomeHelpSeans());
                  },
                ),
                TextBuilderWidgets(
                  icon: Icons.person,
                  text: "About Us",
                  onTap: () async {
                    await launchUrlString(
                        'https://main--nostalgic-jennings-63dd2f.netlify.app/#/');
                  },
                ),
              ],
            ),
            TextBuilderWidgets(
              icon: Icons.currency_bitcoin,
              text: "buy coin",
              onTap: () async {
                await launchUrlString('https://coinmarketcap.com/');
              },
            ),
          ],
        ),
      ),
    );
  }
}
