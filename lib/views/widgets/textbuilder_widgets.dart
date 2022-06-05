import 'package:flutter/material.dart';

import '../../module/constant.dart';
import '../../module/extension.dart';

class TextBuilderWidgets extends StatelessWidget {
  const TextBuilderWidgets(
      {Key? key,
      this.icon,
      this.textstyle,
      this.padding,
      required this.onTap,
      required this.text,
      this.iconcolor})
      : super(key: key);
  final Function()? onTap;
  final String text;
  final IconData? icon;
  final TextStyle? textstyle;
  final Color? iconcolor;
  final int? padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Padding(
        padding: padding == null
            ? const EdgeInsets.only(top: 25)
            : const EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, size: 25, color: iconcolor ?? kwhite),
            SizedBox(
              width: icon == null ? 0 : 15,
            ),
            Text(
              text,
              style: textstyle ??
                  context.textTheme.subtitle2!.copyWith(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
