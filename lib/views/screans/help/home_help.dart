import '../../../main.dart';
import '../../../module/constant.dart';
import '../../../module/extension.dart';
import 'package:flutter/material.dart';

import '../../widgets/textbuilder_widgets.dart';

class HomeHelpSeans extends StatelessWidget {
  const HomeHelpSeans({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          title: Text(
            'Help',
            style: context.textTheme.subtitle1,
          )),
      body: Container(
        padding: const EdgeInsets.all(Constans.padding),
        child: Column(
          children: [
            TextBuilderWidgets(
              padding: 1,
              iconcolor: appProvider.brightness ? kwhite : kblack,
              onTap: () {},
              icon: Icons.error,
              text: 'We have problems',
              textstyle: context.textTheme.subtitle2!.copyWith(color: kblack),
            )
          ],
        ),
      ),
    );
  }
}
