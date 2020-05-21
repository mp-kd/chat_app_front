import 'package:flutter/material.dart';

class LocaleModel extends ChangeNotifier {
  Locale _locale = Locale('en');

  Locale get getLocale => _locale;

  void changeLocale(Locale locale) {
    this._locale = locale;

    notifyListeners();
  }
}
