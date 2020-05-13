import 'package:chat_app_front/auth/widgets/auth_label_keys.dart';
import 'package:chat_app_front/global_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth_buttons.dart';
import 'auth_form.dart';

class AuthPage extends StatelessWidget {
  final List<Color> gradientColors = [
    Color.fromARGB(255, 44, 31, 77),
    Color.fromARGB(200, 66, 0, 43)
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthFormType(),
      child: Consumer<AuthFormType>(
        builder: (context, type, child) => Scaffold(
          body: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: gradientColors,
                stops: [0.4, 1.0],
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    child: buttonsSection(context),
                    margin: EdgeInsets.only(top: 50),
                  ),
                  Container(
                    child: AuthForm(type.authType),
                    margin: EdgeInsets.symmetric(horizontal: 40),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buttonsSection(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          AuthButton(
            AuthButtonType.UNDERLINED_ON_SELECT,
            GlobalLocalizations.of(context)
                .translate(AuthLabelKeys.login)
                .toUpperCase(),
            () => Provider.of<AuthFormType>(context, listen: false)
                .changeAuthType(AuthType.LOGIN),
            authType: AuthType.LOGIN,
          ),
          AuthButton(
            AuthButtonType.UNDERLINED_ON_SELECT,
            GlobalLocalizations.of(context)
                .translate(AuthLabelKeys.signUp)
                .toUpperCase(),
            () => Provider.of<AuthFormType>(context, listen: false)
                .changeAuthType(AuthType.SIGN_UP),
            authType: AuthType.SIGN_UP,
          ),
        ],
      ),
    );
  }
}
