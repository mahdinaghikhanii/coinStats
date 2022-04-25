import 'package:coinstats/constant.dart';
import 'package:coinstats/views/screans/setting_screans.dart';
import 'package:coinstats/views/widgets/textbuilder_widgets.dart';
import 'package:flutter/material.dart';

class SidBarWidgets extends StatelessWidget {
  const SidBarWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      color: Colors.indigo.shade900,
      child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 40, bottom: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    child: Icon(
                      Icons.person,
                      color: kwhite,
                    ),
                    radius: 40,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Mahdi',
                    style: textTheme.subtitle1,
                  ),
                  Text(
                    'Mahdinkh7@gmail.com',
                    style: textTheme.bodyText1?.copyWith(color: Colors.blue),
                  )
                ],
              ),
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
                  onTap: () {},
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
                  onTap: () {},
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
