import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowToast extends StatelessWidget {
  final Color? textColor;
  final Color? backFroundColor;
  final double? fontSize;
  final String msg;

  const ShowToast(
      {this.textColor,
      this.backFroundColor,
      this.fontSize,
      required this.msg,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Fluttertoast.showToast(
            msg: msg,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: backFroundColor,
            textColor: textColor,
            fontSize: fontSize);
      },
    );
  }
}
