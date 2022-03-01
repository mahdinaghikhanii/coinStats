import 'package:coinstats/util/view_models/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreans extends StatelessWidget {
  const HomeScreans({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(child: Icon(Icons.brightness_1)),
      ),
      body: Column(
        children: [
          Checkbox(
            onChanged: (bool? value) {
              appProvider.brightnessChange = value!;
            },
            value: appProvider.brightness,
          )
        ],
      ),
    );
  }
}
