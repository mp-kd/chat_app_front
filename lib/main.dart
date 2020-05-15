import 'package:chat_app_front/auth/widgets/auth_page.dart';
import 'package:chat_app_front/global_localization.dart';
import 'package:chat_app_front/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'auth/infrastructure/user_facade_impl.dart';
import 'auth/user.dart';
import 'auth/user_service.dart';
import 'auth/widgets/auth_form.dart';
import 'auth/widgets/message_frame.dart';
import 'dashboard_page.dart';
import 'locale_model.dart';

main() {
  UserFacade _userFacade =
      UserFacadeImpl("https://mp-kd-chatapp.herokuapp.com");
  runApp(ChatApp(UserServiceImpl(_userFacade)));
}

class ChatApp extends StatelessWidget {
  final UserService _userService;

  const ChatApp(this._userService) : super();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthFormType>(create: (_) => AuthFormType()),
        ChangeNotifierProvider<UserServiceModel>(
          create: (_) => UserServiceModel(_userService),
        ),
        ChangeNotifierProvider<MessageFrameModel>(
          create: (_) => MessageFrameModel(),
        ),
        ChangeNotifierProvider<LocaleModel>(create: (_) => LocaleModel())
      ],
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
          theme: ThemeData(
              primaryColor: Colors.white,
              accentColor: Colors.red,
              primaryTextTheme: TextTheme(
                  button: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  caption: TextStyle(
                    color: Colors.white,
                  )),
              accentTextTheme: TextTheme(
                  button: TextStyle(
                    color: Colors.grey,
                  ),
                  caption: TextStyle(
                    color: Colors.grey,
                  ))),
          initialRoute: '/',
          routes: {
            '/': (context) => LandingPage(),
            '/auth': (context) => AuthPage(),
            '/dashboard': (context) => DashboardPage(),
          },
        ),
      ),
    );
  }
}
