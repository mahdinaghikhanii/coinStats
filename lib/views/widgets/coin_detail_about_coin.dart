import 'package:coinstats/main.dart';
import 'package:coinstats/theme/constant.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CoinDetailAboutCoin extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const CoinDetailAboutCoin(
      {required this.deetial,
      required this.name,
      required this.icon,
      required this.datachcart});

  final String name;
  final String deetial;
  final IconData icon;
  final String datachcart;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: const TextStyle(fontSize: 15, color: grey)),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                deetial,
                style: TextStyle(
                    color: appProvider.brightness ? kwhite : kwhite,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              const Spacer(),
              Icon(icon),
              Text(datachcart)
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            indent: 2,
            endIndent: 2,
            color: kwhite,
          )
        ],
      ),
    );
  }
}
