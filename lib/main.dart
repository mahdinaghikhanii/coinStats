import 'package:coinstats/theme/configtheme.dart';
import 'package:coinstats/views/screans/getstart_scra.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter coin',
      theme: ConfigTheme().getTheme(),
      home: const GetStartScreans(),
    );
  }
}
