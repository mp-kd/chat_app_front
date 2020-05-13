import 'package:chat_app_front/global_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth_form.dart';

enum AuthButtonType {
  SUBMIT,
  UNDERLINED_ON_SELECT,
}

abstract class AuthButton extends StatelessWidget {
  AuthButton._();

  factory AuthButton(AuthButtonType type, String label, Function onPressed, {AuthType authType}) {
    switch (type) {
      case AuthButtonType.SUBMIT:
        return SubmitAuthButton(label, onPressed);
      case AuthButtonType.UNDERLINED_ON_SELECT:
        return UnderlinedOnSelectButton(label, onPressed, authType);
    }
    throw Exception("Unknown button type");
  }
}

class UnderlinedOnSelectButton extends AuthButton {
  final String label;
  final Function onPressed;
  final AuthType authType;
  UnderlinedOnSelectButton(this.label, this.onPressed, this.authType) : super._();

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(
        label,
        style: Provider.of<AuthFormType>(context).authType == authType
            ? Theme.of(context).primaryTextTheme.button
            : Theme.of(context).accentTextTheme.button,
      ),
      onPressed: onPressed,
    );
  }
}

class SubmitAuthButton extends AuthButton {
  final String label;
  final Function onPressed;

  SubmitAuthButton(this.label, this.onPressed) : super._();

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        minWidth: double.infinity,
        height: 40,
        child: RaisedButton(
          child: Text(
            label,
            style: Theme.of(context).primaryTextTheme.button,
          ),
          color: Theme.of(context).accentColor,
          onPressed: onPressed,
        ));
  }
}
