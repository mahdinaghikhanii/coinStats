import 'package:coinstats/constant.dart';
import 'package:flutter/material.dart';

class BuilderListTileWidgets extends StatelessWidget {
  const BuilderListTileWidgets({
    Key? key,
    required this.icon,
    required this.title,
    this.showSwitchButton = false,
    this.onChanged,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final bool showSwitchButton;
  final VoidCallback? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            const BoxShadow(
              color: Colors.white,
              offset: Offset(0.0, 0.0),
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
                inactiveTrackColor: kblue,
                activeColor: kblue.withOpacity(0.6),
                value: showSwitchButton,
                onChanged: (val) {})
            : const Icon(
                Icons.keyboard_arrow_right,
                size: 28,
                color: Colors.grey,
              ),
        leading: Icon(
          icon,
          size: 26,
          color: kblue.withOpacity(0.6),
        ),
        title: Text(title,
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: Colors.grey.shade600)),
      ),
    );
  }
}
