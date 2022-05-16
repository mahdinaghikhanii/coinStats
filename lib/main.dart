import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'provider/app_provider/app_provider.dart';
import 'provider/home_provoder/home_provider.dart';
import 'theme/configtheme.dart';
import 'views/screans/getstart_scra.dart';
import 'views/screans/home_screans.dart';

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

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appProvider}) : super(key: key);
  final AppProvider appProvider;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => BottomNavigationBarProvider()),
        ChangeNotifierProvider<AppProvider>(create: (context) => appProvider),
      ],
      child: Consumer<AppProvider>(builder: (context, model, child) {
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
