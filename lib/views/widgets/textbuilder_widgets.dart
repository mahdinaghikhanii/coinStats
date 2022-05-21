import 'package:coinstats/module/constant.dart';
import 'package:flutter/material.dart';

class TextBuilderWidgets extends StatelessWidget {
  const TextBuilderWidgets(
      {Key? key, required this.icon, required this.onTap, required this.text})
      : super(key: key);
  final Function()? onTap;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Row(
          children: [
            Icon(
              icon,
              color: kwhite,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.subtitle2,
            )
          ],
        ),
      ),
    );
  }
}
