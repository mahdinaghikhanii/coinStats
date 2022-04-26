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
