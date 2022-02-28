import 'package:coinstats/theme/configtheme.dart';
import 'package:coinstats/util/view_models/app_provider.dart';
import 'package:coinstats/views/screans/getstart_scra.dart';
import 'package:coinstats/views/screans/home_screans.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isviewedgetstartscreans;
AppProvider appProvider = AppProvider();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  isviewedgetstartscreans = sharedPreferences.getInt("VIEWED");
  await appProvider.geTheme();
  runApp(MyApp(
    appProvider: appProvider,
  ));
}

class MyApp extends StatefulWidget {
  MyApp({required this.appProvider});

  @override
  State<MyApp> createState() => _MyAppState();
  final AppProvider appProvider;
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (
        context,
      ) =>
          appProvider,
      child: Consumer(builder: (BuildContext context, value, Widget? child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            darkTheme: ThemeData.dark(),
            title: 'CoinStats',
            home: isviewedgetstartscreans != 0
                ? const GetStartScreans()
                : const HomeScreans());
      }),
    );
  }
}
