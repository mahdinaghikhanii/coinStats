import 'package:flutter/cupertino.dart';

class ErrorWidgets extends StatelessWidget {
  const ErrorWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [Text('Error')],
      ),
    );
  }
}
