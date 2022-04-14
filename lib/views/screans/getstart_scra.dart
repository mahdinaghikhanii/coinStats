import 'package:coinstats/constant.dart';
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
      floatingActionButton: InkWell(
        borderRadius: BorderRadius.circular(Constans.smallBorderRadios),
        onTap: () {
          preferencesisviewed();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreans()));
        },
        child: Container(
          width: 140,
          height: 60,
          decoration: BoxDecoration(
              color: kblue,
              borderRadius: BorderRadius.circular(Constans.smallBorderRadios)),
          child: Center(
              child: Text(
            'Lets Go',
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
          children: [
            const SizedBox(
              height: 80,
            ),
            Image.asset(
              'assets/images/onboard.png',
              width: 300,
              height: 300,
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(Constans.padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('See 100 Top Currency',
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          fontSize: 24,
                          color: kblue,
                          fontWeight: FontWeight.w800)),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                      "The evre best place to see digital currency pricen fluctuations",
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          ?.copyWith(color: grey600)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
