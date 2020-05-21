import 'package:chat_app_front/localization/global_localization.dart';
import 'package:chat_app_front/theme/theme_model.dart';
import 'package:chat_app_front/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';
import 'localization/locale_model.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LocaleModel>(
          create: (_) => LocaleModel(),
        ),
        ChangeNotifierProvider<ThemeModel>(
          create: (_) => ThemeModel(ChatAppThemes.defaultTheme),
        )
      ],
      child: Consumer2<LocaleModel, ThemeModel>(
        builder: (context, localeModel, themeModel, child) => MaterialApp(
          title: "ChatApp",
          locale: Provider.of<LocaleModel>(context).getLocale,
          supportedLocales: [
            Locale('en', ''),
            Locale('pl', ''),
          ],
          localizationsDelegates: [
            GlobalLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          theme: Provider.of<ThemeModel>(context).getTheme,
          home: HomePage(title: "Title"),
        ),
      ),
    );
  }
}
