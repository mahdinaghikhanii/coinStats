import 'package:coinstats/theme/constant.dart';
import 'package:coinstats/views/screans/home_screans.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetStartScreans extends StatelessWidget {
  const GetStartScreans({Key? key}) : super(key: key);

  // ignore: constant_identifier_names
  static const IS_VIEWED = "VIEWED";
  void preferencesisviewed() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt(IS_VIEWED, 0);
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: InkWell(
        onTap: () {
          preferencesisviewed();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreans()));
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
              color: Color(0xFF00004C), shape: BoxShape.circle),
          child: Center(
              child: Text(
            'Next',
            style: Theme.of(context)
                .textTheme
                .button
                ?.copyWith(color: kwhite, fontSize: 16),
          )),
        ),
      ),
      backgroundColor: kwhite,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Image.asset(
                'assets/images/onboard.png',
                width: 300,
                height: 300,
              ),
            ),
            const SizedBox(
              height: 0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'Currency',
                      style: Theme.of(context).textTheme.headlineLarge),
                  TextSpan(
                      text: ' price fluctuations',
                      style: Theme.of(context).textTheme.headline5)
                ])),
                const SizedBox(
                  height: 20,
                ),
                Text(
                    "The best place to see digital currency pricen\n  fluctuations",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.caption),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
