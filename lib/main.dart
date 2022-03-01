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
  await appProvider.getDarkThemeOrLightTeam();
  runApp(MyApp(
    appProvider: appProvider,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key, required this.appProvider}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
  final AppProvider appProvider;
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppProvider>(
      create: (
        context,
      ) =>
          appProvider,
      child: Consumer<AppProvider>(builder: (context, model, child) {
        appProvider;
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ConfigTheme.themeData(model.brightness, context),
            title: 'CoinStats',
            home: isviewedgetstartscreans != 0
                ? const GetStartScreans()
                : const HomeScreans());
      }),
    );
  }
}
