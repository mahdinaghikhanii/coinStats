import 'package:coinstats/module/extension.dart';
import 'package:coinstats/views/screans/favorite_screans.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../module/constant.dart';
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
                  width: 80,
                  height: 80,
                  child: CircleAvatar(
                    backgroundColor: kgerey300,
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/mahdi.jpg",
                        width: 75,
                        height: 75,
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
                      'Mahdi naghikhani',
                      style: textTheme.subtitle2
                          ?.copyWith(fontSize: 18, fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('View profile',
                        style: textTheme.subtitle2?.copyWith(
                            color: kgerey300,
                            fontSize: 16,
                            fontWeight: FontWeight.w700))
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
                  icon: Icons.person,
                  text: "Profile",
                  onTap: () {},
                ),
                TextBuilderWidgets(
                  icon: Icons.help,
                  text: "Help",
                  onTap: () {},
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
              icon: Icons.logout,
              text: "Log out",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
