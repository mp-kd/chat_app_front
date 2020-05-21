import 'package:flutter/material.dart';

class LocaleModel extends ChangeNotifier {
  Locale locale = Locale('en');

  Locale get getLocale => locale;

  void changeLocale(Locale locale) {
    this.locale = locale;

    notifyListeners();
  }
}
