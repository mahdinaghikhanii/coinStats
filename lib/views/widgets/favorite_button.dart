import 'package:flutter/material.dart';

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
    return InkWell(
      onTap: () {},
      child: Icon(
        Icons.favorite,
        size: iconSize ?? 22,
      ),
    );
  }
}
