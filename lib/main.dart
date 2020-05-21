import 'package:chat_app_front/localization/global_localization.dart';
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
        )
      ],
      child: Consumer<LocaleModel>(
        builder: (context, localeModel, child) => MaterialApp(
          title: "ChatApp",
          locale: Provider.of<LocaleModel>(context).locale,
          supportedLocales: [
            Locale('en', ''),
            Locale('pl', ''),
          ],
          localizationsDelegates: [
            GlobalLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          theme: ThemeData(
            primarySwatch: Colors.green,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: HomePage(title: "Title"),
        ),
      ),
    );
  }
}
