import 'package:coinstats/theme/constant.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports

class DialogSettingScreans extends StatelessWidget {
  const DialogSettingScreans({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Dialog(
        insetPadding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constans.padding),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: size.height * 0.30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Center(
                          child: Row(children: [
                        Text(
                          'DARM MODE',
                        ),
                        Spacer(),
                        Icon(Icons.dark_mode)
                      ])),
                    ),
                  ],
                ),
              ),
              /* Positioned(
                  top: -size.height * 0.12,
                  child: Image.asset('assets/images/setting.png'),
                  width: size.width * 0.55,
                  height: size.height * 0.17),*/
            ]));
  }
}
