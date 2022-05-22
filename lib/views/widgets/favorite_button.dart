import 'package:flutter/material.dart';

import '../../module/constant.dart';

class MFavoriteButton extends StatelessWidget {
  final double? iconSize;
  final Color? iconColor;
  final Color? disabelColor;
  final bool isFavorite;
  final VoidCallback? ontap;

  const MFavoriteButton(
      {this.disabelColor,
      this.ontap,
      this.iconColor,
      this.isFavorite = false,
      this.iconSize,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final mfb = Provider.of<WidgetPrvider>(context);
    return InkWell(
      borderRadius: BorderRadius.circular(Constans.smallBorderRadios),
      onTap: ontap,
      child: Icon(
        Icons.favorite,
        size: iconSize ?? 30,
        color: isFavorite ? kred : kblack,
      ),
    );
  }
}
