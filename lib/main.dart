import 'package:coinstats/theme/configtheme.dart';
import 'package:coinstats/views/screans/getstart_scra.dart';
import 'package:coinstats/views/screans/home_screans.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isviewedgetstartscreans;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  isviewedgetstartscreans = sharedPreferences.getInt("VIEWED");
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
        home: isviewedgetstartscreans != 0
            ? const GetStartScreans()
            : const HomeScreans());
  }
}
