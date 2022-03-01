import 'package:coinstats/theme/constant.dart';
import 'package:flutter/material.dart';

class CardTopCoin extends StatelessWidget {
  const CardTopCoin({Key? key}) : super(key: key);

  /* CardTopCoin(
      {required this.image, required this.nameCoin, required this.price});
  final String image;
  final String nameCoin;
  final int price;*/

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(Constans.padding),
          child: Row(
            children: [
              Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.transparent),
                  child: Image.asset(
                    'assets/icon/pngegg.png',
                    height: size.height * 0.05,
                  )),
              SizedBox(width: size.width * 0.02),
              Text(
                'Bitcoin',
                style: Theme.of(context).textTheme.caption,
              ),
              Text(
                '9.97 %',
                style: TextStyle(color: Colors.green),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text('143.201.25'),
        )
      ],
    );
  }
}
