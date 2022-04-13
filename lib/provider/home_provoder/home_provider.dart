import 'package:flutter/foundation.dart';

class BottomNavigationBarProvider extends ChangeNotifier {
  int _indexnavbar = 0;
  int get getindexNavBar => _indexnavbar;

  setIndexNavbar(int i) {
    _indexnavbar = i;
    notifyListeners();
  }
}
