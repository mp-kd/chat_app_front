import 'package:chat_app_front/auth/widgets/auth_page.dart';
import 'package:chat_app_front/global_localization.dart';
import 'package:chat_app_front/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'locale_model.dart';

main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LocaleModel(),
      child: Consumer<LocaleModel>(
        builder: (context, provider, child) => MaterialApp(
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
          initialRoute: '/',
          routes: {
            '/': (context) => LandingPage(),
            '/auth': (context) => AuthPage(),
          },
        ),
      ),
    );
  }
}
