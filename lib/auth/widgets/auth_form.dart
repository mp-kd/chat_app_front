import 'package:chat_app_front/auth/widgets/auth_buttons.dart';
import 'package:chat_app_front/auth/widgets/auth_label_keys.dart';
import 'package:chat_app_front/global_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum AuthType { LOGIN, SIGN_UP, FORGOT_PASSWORD }

class AuthFormType with ChangeNotifier {
  AuthType authType = AuthType.LOGIN;

  AuthType get getAuthType => authType;

  void changeAuthType(AuthType type) {
    authType = type;

    notifyListeners();
  }
}

abstract class AuthForm extends StatelessWidget {
  AuthForm._();

  factory AuthForm(AuthType type) {
    switch (type) {
      case AuthType.LOGIN:
        return LoginForm();
      case AuthType.SIGN_UP:
        return SignUpForm();
      case AuthType.FORGOT_PASSWORD:
        return ForgotPasswordForm();
    }
    throw Exception('Unknown auth type');
  }
}

class ForgotPasswordForm extends AuthForm {
  ForgotPasswordForm() : super._();

  final TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          _createFormField(
              context,
              GlobalLocalizations.of(context).translate(AuthLabelKeys.username),
              usernameController,
              (_) => null),
          AuthButton(
              AuthButtonType.SUBMIT,
              GlobalLocalizations.of(context)
                  .translate(AuthLabelKeys.resetPassword)
                  .toUpperCase(),
              _resetPasswordButtonAction),
        ],
      ),
    );
  }

  //TODO: handle reset password request
  void _resetPasswordButtonAction() {}
}

class SignUpForm extends AuthForm {
  SignUpForm() : super._();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: _createFormField(
                context,
                GlobalLocalizations.of(context).translate(AuthLabelKeys.email),
                emailController,
                (value)=>EmailValidator.validate(value)?null:"Such email doesn't exist"),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: _createFormField(
                context,
                GlobalLocalizations.of(context).translate(AuthLabelKeys.username),
                usernameController,
                (_) => null),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: _createFormField(
                context,
                GlobalLocalizations.of(context).translate(AuthLabelKeys.password),
                passwordController,
                (_) => null,
                isPassword: true),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: _createFormField(
                context,
                GlobalLocalizations.of(context)
                    .translate(AuthLabelKeys.repeatPassword),
                repeatPasswordController,
                (_) => null,
                isPassword: true),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(GlobalLocalizations.of(context)
                .translate(AuthLabelKeys.termsOfService),
            style: Theme.of(context).primaryTextTheme.caption,),
          ),
          AuthButton(
              AuthButtonType.SUBMIT,
              GlobalLocalizations.of(context)
                  .translate(AuthLabelKeys.signUp)
                  .toUpperCase(),
              _signUpButtonAction),
        ],
      ),
    );
  }

  //TODO: handle sign up request
  void _signUpButtonAction() {}
}

class LoginForm extends AuthForm {
  LoginForm() : super._();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                child: _createFormField(
                    context,
                    GlobalLocalizations.of(context)
                        .translate(AuthLabelKeys.username),
                    usernameController,
                    (_) => null),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                child: _createFormField(
                    context,
                    GlobalLocalizations.of(context)
                        .translate(AuthLabelKeys.password),
                    passwordController,
                    (_) => null,
                    isPassword: true),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 14),
                  child: AuthButton(
                      AuthButtonType.SUBMIT,
                      GlobalLocalizations.of(context)
                          .translate(AuthLabelKeys.login)
                          .toUpperCase(),
                      _loginButtonAction)),
            ],
          ),
        ),
        MaterialButton(
          child: Text(
            GlobalLocalizations.of(context)
                .translate(AuthLabelKeys.forgotPassword),
            style: Theme.of(context).accentTextTheme.button,
          ),
          onPressed: () => Provider.of<AuthFormType>(context, listen: false)
              .changeAuthType(AuthType.FORGOT_PASSWORD),
        ),
      ],
    );
  }

  //TODO: handle login request
  void _loginButtonAction() {}
}

TextFormField _createFormField(BuildContext context, String label,
    TextEditingController controller, String Function(String) validator,
    {bool isPassword = false}) {
  return TextFormField(
      controller: controller,
      validator: validator,
      autovalidate: true,
      obscureText: isPassword,
      style: Theme.of(context).primaryTextTheme.button,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).accentTextTheme.caption.color)
        ),
        labelText: label,
        labelStyle: Theme.of(context).accentTextTheme.button,
      ));
}
