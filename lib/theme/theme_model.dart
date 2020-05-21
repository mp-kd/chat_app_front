import 'package:flutter/material.dart';

class ThemeModel extends ChangeNotifier {
  ThemeData _theme;

  ThemeModel(this._theme);

  ThemeData get getTheme => _theme;

  void changeTheme(ThemeData themeData) {
    this._theme = themeData;

    notifyListeners();
  }
}
