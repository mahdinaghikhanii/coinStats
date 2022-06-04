import 'package:flutter/material.dart';

import '../../module/constant.dart';
import '../../main.dart';

class BuilderListTileWidgets extends StatelessWidget {
  const BuilderListTileWidgets({
    Key? key,
    this.icon,
    required this.title,
    this.onTap,
    this.val = false,
    this.showSwitchButton = false,
    this.onChanged,
  }) : super(key: key);

  final IconData? icon;
  final Function()? onTap;
  final String title;
  final bool showSwitchButton;
  final Function(bool)? onChanged;
  final bool val;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400.withOpacity(0.1),
                offset: const Offset(
                  5.0,
                  5.0,
                ),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ), //BoxShadow
              BoxShadow(
                color: Theme.of(context).scaffoldBackgroundColor,
                offset: const Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              )
            ], //BoxShadow
            border: Border.all(
              width: 1.5,
              color: Colors.grey.shade400.withOpacity(0.2),
            ),
            borderRadius: BorderRadius.circular(Constans.mediumBorderRadios)),
        child: ListTile(
          trailing: showSwitchButton
              ? Switch(
                  inactiveTrackColor: appProvider.brightness ? grey : kblue,
                  activeColor:
                      appProvider.brightness ? kwhite : kblue.withOpacity(0.6),
                  value: val,
                  inactiveThumbColor: kwhite,
                  onChanged: onChanged)
              : const Icon(
                  Icons.keyboard_arrow_right,
                  size: 28,
                  color: Colors.grey,
                ),
          leading: Icon(
            icon,
            size: 26,
            color: appProvider.brightness
                ? kwhite.withOpacity(0.6)
                : kblue.withOpacity(0.6),
          ),
          title: Text(title,
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: appProvider.brightness
                      ? Colors.grey.shade300
                      : Colors.grey.shade600)),
        ),
      ),
    );
  }
}
