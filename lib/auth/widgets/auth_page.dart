import 'package:chat_app_front/global_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth_form.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthFormType(),
      child: Consumer<AuthFormType>(
        builder: (context, type, child) =>
            Scaffold(
              body: Column(
                children: <Widget>[
                  buttonsSection(context),
                  AuthForm(type.authType),
                ],
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
          _buildAuthButton(AuthType.LOGIN,
              GlobalLocalizations.of(context).translate('loginButtonText'), context),
          _buildAuthButton(AuthType.SIGN_UP,
              GlobalLocalizations.of(context).translate('signUpButtonText'), context),
        ],
      ),
    );
  }

  Widget _buildAuthButton(AuthType type, String label, BuildContext context) {
    return MaterialButton(
      child: Text(label),
      onPressed: () {
        if (type == AuthType.LOGIN) {
          Provider.of<AuthFormType>(context, listen: false).changeAuthType(AuthType.LOGIN);
        }else if (type == AuthType.SIGN_UP){
          Provider.of<AuthFormType>(context, listen: false)
              .changeAuthType(AuthType.SIGN_UP);
        }
      },

    );
  }
}