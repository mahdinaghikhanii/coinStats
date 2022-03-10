import 'package:coinstats/util/view_models/connectivity_provider.dart';
import 'package:coinstats/views/screans/home_screans.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckNetWork extends StatelessWidget {
  const CheckNetWork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<ConnectivityChangeNotifier>(builder:
        (BuildContext context,
            ConnectivityChangeNotifier connectivityChangeNotifier,
            Widget? child) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 40,
          ),
          Image.asset(connectivityChangeNotifier.pngUrl),
          SizedBox(
            height: 30,
          ),
          Text(connectivityChangeNotifier.pageText),
          if (connectivityChangeNotifier.connectiviry !=
              ConnectivityResult.wifi)
            Flexible(
              child: RaisedButton(
                  child: Text('Open Settings'), onPressed: () => HomeScreans),
            )
        ],
      );
    }));
  }
}
