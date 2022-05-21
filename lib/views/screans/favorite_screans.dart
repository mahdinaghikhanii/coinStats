import 'package:flutter/material.dart';

import '../../module/constant.dart';
import '../../module/extension.dart';
import '../widgets/fav_items_widgets.dart';

class FavoriteScreans extends StatelessWidget {
  const FavoriteScreans({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: kblack,
            )),
        centerTitle: false,
        title: Text(
          'Favorite',
          style: context.textTheme.subtitle1,
        ),
      ),
      body: SizedBox(
          height: size.height,
          width: size.width,
          child: const FavoriteIteamsWidgets()),
    );
  }
}
