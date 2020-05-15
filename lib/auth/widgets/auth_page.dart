import 'package:chat_app_front/auth/auth_label_keys.dart';
import 'package:chat_app_front/auth/user.dart';
import 'package:chat_app_front/auth/widgets/message_frame.dart';
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
    return Consumer<AuthFormType>(
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
                  child: MessageFrame(),
                  margin: EdgeInsets.only(top: 15),
                ),
                Container(
                  child: Consumer<UserServiceModel>(
                      builder: (context, model, child) =>
                          AuthForm(type.authType)),
                  margin: EdgeInsets.symmetric(horizontal: 40),
                ),
              ],
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
            () {
              Provider.of<AuthFormType>(context, listen: false)
                  .changeAuthType(AuthType.LOGIN);
              Provider.of<MessageFrameModel>(context, listen: false)
                  .changeMessageFrame(
                      MessageType.SUCCESS, AuthLabelKeys.emptyString);
            },
            authType: AuthType.LOGIN,
          ),
          AuthButton(
            AuthButtonType.UNDERLINED_ON_SELECT,
            GlobalLocalizations.of(context)
                .translate(AuthLabelKeys.signUp)
                .toUpperCase(),
            () {
              Provider.of<AuthFormType>(context, listen: false)
                  .changeAuthType(AuthType.SIGN_UP);
              Provider.of<MessageFrameModel>(context, listen: false)
                  .changeMessageFrame(
                      MessageType.SUCCESS, AuthLabelKeys.emptyString);
            },
            authType: AuthType.SIGN_UP,
          ),
        ],
      ),
    );
  }
}
