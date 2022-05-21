import 'package:coinstats/module/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/widget_provider/widget_provider.dart';

class MFavoriteButton extends StatelessWidget {
  final double? iconSize;
  final Color? iconColor;
  final Color? disabelColor;
  final bool isFavorite;

  const MFavoriteButton(
      {this.disabelColor,
      this.iconColor,
      this.isFavorite = false,
      this.iconSize,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mfb = Provider.of<WidgetPrvider>(context);
    return InkWell(
      onTap: () {
        mfb.setMfavoriteButton(isFavorite);
      },
      child: Icon(
        Icons.favorite,
        size: iconSize ?? 22,
        color: isFavorite ? kred : kgrey200,
      ),
    );
  }
}
