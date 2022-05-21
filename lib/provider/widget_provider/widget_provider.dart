import 'package:flutter/material.dart';

class WidgetPrvider with ChangeNotifier {
  bool _mFavoriteButton = false;
  get getMFavoriteButton => _mFavoriteButton;

  void setMfavoriteButton(bool val) {
    _mFavoriteButton = val;
    notifyListeners();
  }
}
