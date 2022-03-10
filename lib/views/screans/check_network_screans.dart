import 'package:coinstats/theme/constant.dart';
import 'package:coinstats/util/view_models/connectivity_provider.dart';
import 'package:coinstats/views/screans/home_screans.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckNetWork extends StatelessWidget {
  const CheckNetWork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(body: Consumer<ConnectivityChangeNotifier>(builder:
        (BuildContext context,
            ConnectivityChangeNotifier connectivityChangeNotifier,
            Widget? child) {
      return Scaffold(
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
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeScreans()));
                },
                child: Container(
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
      );
    }));
  }
}
