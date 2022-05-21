import 'package:coinstats/module/constant.dart';
import 'package:coinstats/views/screans/home_screans.dart';

import 'package:flutter/material.dart';

class CheckNetWork extends StatelessWidget {
  const CheckNetWork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return WillPopScope(
      onWillPop: () async {
        ScaffoldMessenger.of(context);
        return false;
      },
      child: Scaffold(
        backgroundColor: kblue,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Image.asset(
                    "assets/images/internet.png",
                    width: size.width * 0.70,
                    height: size.width * 0.60,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    'No internet Connections !',
                    style: textTheme.subtitle2,
                  ),
                ],
              ),
              InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreans()));
                },
                child: SizedBox(
                  width: size.width * 0.35,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.repeat,
                        color: kwhite,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Try again',
                        style: textTheme.subtitle2,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
