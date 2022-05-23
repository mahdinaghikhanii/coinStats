import 'package:flutter/cupertino.dart';

import '../../module/extension.dart';

class NothingIsHereWidgets extends StatelessWidget {
  const NothingIsHereWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/favorite.png',
          width: 250,
          height: 250,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'You have no\nFavorite',
          style: context.textTheme.subtitle1,
          textAlign: TextAlign.center,
        )
      ],
    ).center;
  }
}
