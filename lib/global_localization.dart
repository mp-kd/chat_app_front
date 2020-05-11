import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GlobalLocalizations {
  final Locale locale;

  GlobalLocalizations(this.locale);

  static GlobalLocalizations of(BuildContext context) {
    return Localizations.of<GlobalLocalizations>(context, GlobalLocalizations);
  }

  static const LocalizationsDelegate<GlobalLocalizations> delegate =
      _GlobalLocalizationsDelegate();

  Map<String, String> _localizedStrings;

  Future<bool> load() async {
    String jsonString =
        await rootBundle.loadString('lang/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  String translate(String key) {
    return _localizedStrings[key];
  }
}

class _GlobalLocalizationsDelegate
    extends LocalizationsDelegate<GlobalLocalizations> {
  const _GlobalLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'pl'].contains(locale.languageCode);
  }

  @override
  Future<GlobalLocalizations> load(Locale locale) async {
    GlobalLocalizations localizations = new GlobalLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_GlobalLocalizationsDelegate old) => false;
}
