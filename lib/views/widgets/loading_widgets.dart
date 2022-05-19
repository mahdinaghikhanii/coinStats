import 'package:coinstats/main.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';

class LoadingWidgets extends StatelessWidget {
  const LoadingWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            centerTitle: false,
            leading: Padding(
                padding: const EdgeInsets.only(left: Constans.padding),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu,
                      color: grey,
                    ))),
            automaticallyImplyLeading: false,
            title: Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Text(
                'CoinStats',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            )),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: size.width,
                height: 240,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 8, bottom: 16),
                          child: Container(
                            height: 200,
                            width: 300,
                            padding: const EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                                color: appProvider.brightness
                                    ? kgrey200.withOpacity(0.2)
                                    : kgrey200.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(25)),
                          ));
                    })),
            Padding(
                padding: const EdgeInsets.all(Constans.padding),
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Container(
                        height: 30,
                        width: 80,
                        decoration: BoxDecoration(
                            color: appProvider.brightness
                                ? kgrey200.withOpacity(0.2)
                                : kgrey200.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(
                                Constans.mediumBorderRadios))),
                    const Spacer(),
                    Center(
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                            color: appProvider.brightness
                                ? kgrey200.withOpacity(0.2)
                                : kgrey200.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(
                                Constans.smallBorderRadios)),
                        width: 60,
                      ),
                    )
                  ],
                )),
            Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 16),
                            child: Container(
                              height: 70.0,
                              width: size.width,
                              padding: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                  color: appProvider.brightness
                                      ? kgrey200.withOpacity(0.2)
                                      : kgrey200.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(16)),
                              child: Container(),
                            ),
                          ));
                    }))
          ],
        ));
  }
}
