import 'package:coinstats/constant.dart';
import 'package:coinstats/provider/home_provoder/home_provider.dart';
import 'package:coinstats/views/screans/favorite_screans.dart';
import 'package:coinstats/views/screans/home_screans.dart';
import 'package:coinstats/views/screans/setting_screans.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeNavbar extends StatelessWidget {
  const HomeNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List pages = [
      HomeScreans(),
      FavoriteScreans(),
      FavoriteScreans(),
      SettingScreans()
    ];

    final homeProvider = Provider.of<BottomNavigationBarProvider>(context);
    return Scaffold(
        body: pages[homeProvider.getindexNavBar],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: kwhite,
          fixedColor: kblack,
          unselectedItemColor: grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: homeProvider.getindexNavBar,
          onTap: (int index) {
            homeProvider.setIndexNavbar(index);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "favorite"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "settings")
          ],
        ));
  }
}
