import 'package:flutter/material.dart';

class LocaleModel with ChangeNotifier {
  Locale locale = Locale('en');

  Locale get getLocale => locale;

  void changeLocale(Locale l) {
    locale = l;
    notifyListeners();
  }
}
