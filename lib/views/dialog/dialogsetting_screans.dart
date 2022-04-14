// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:coinstats/constant.dart';

import 'package:coinstats/provider/app_provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// ignore: implementation_imports

class DialogSettingScreans extends StatelessWidget {
  const DialogSettingScreans({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appProvider = Provider.of<AppProvider>(context);
    return Dialog(
        insetPadding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constans.padding),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: size.height * 0.25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: appProvider.brightness ? kblack : kwhite),
                padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Center(
                          child: Row(
                        children: [
                          Icon(appProvider.brightness
                              ? Icons.light_mode
                              : Icons.dark_mode),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Text(appProvider.brightness
                              ? "Light Mood"
                              : "Dark mood"),
                          const Spacer(),
                          Switch(
                            activeColor: kwhite,
                            value: appProvider.brightness,
                            onChanged: (bool? value) {
                              appProvider.brightnessChange = value!;
                            },
                          ),
                        ],
                      )),
                    ),
                    const Divider(),
                    InkWell(
                      splashColor: Colors.red,
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Icon(Icons.person),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            Text('About us'),
                            Spacer(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              /* Positioned(
                  top: -size.height * 0.12,
                  child: Image.asset('assets/images/setting.png'),
                  width: size.width * 0.55,
                  height: size.height * 0.17),*/
            ]));
  }
}
