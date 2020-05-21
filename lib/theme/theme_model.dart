import 'package:flutter/material.dart';

class ThemeModel extends ChangeNotifier {
  ThemeData theme;

  ThemeModel(this.theme);

  ThemeData get getTheme => theme;

  void changeTheme(ThemeData themeData) {
    this.theme = themeData;

    notifyListeners();
  }
}
