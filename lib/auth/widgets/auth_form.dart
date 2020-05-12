import 'package:chat_app_front/global_localization.dart';
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
              GlobalLocalizations.of(context).translate('username'),
              usernameController,
              (_) => null),
          MaterialButton(
            child: Text(
                GlobalLocalizations.of(context).translate('resetPassword')),
            onPressed: () => "reseting password",
          ),
        ],
      ),
    );
  }
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
        children: <Widget>[
          _createFormField(GlobalLocalizations.of(context).translate('email'),
              emailController, (_) => null),
          _createFormField(
              GlobalLocalizations.of(context).translate('username'),
              usernameController,
              (_) => null),
          _createFormField(
              GlobalLocalizations.of(context).translate('password'),
              passwordController,
              (_) => null),
          _createFormField(
              GlobalLocalizations.of(context).translate('repeatPassword'),
              repeatPasswordController,
              (_) => null),
          Text(GlobalLocalizations.of(context).translate('termsOfService')),
          MaterialButton(
            child: Text(
                GlobalLocalizations.of(context).translate('signUpButtonText')),
            onPressed: () => print('sign up'),
          )
        ],
      ),
    );
  }
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
            children: <Widget>[
              _createFormField(
                  GlobalLocalizations.of(context).translate('username'),
                  usernameController,
                  (_) => null),
              _createFormField(
                  GlobalLocalizations.of(context).translate('password'),
                  passwordController,
                  (_) => null),
              MaterialButton(
                child: Text(GlobalLocalizations.of(context)
                    .translate('loginButtonText')),
                onPressed: () => print('login'),
              ),
            ],
          ),
        ),
        MaterialButton(
          child:
              Text(GlobalLocalizations.of(context).translate('forgotPassword')),
          onPressed: () => Provider.of<AuthFormType>(context, listen: false)
              .changeAuthType(AuthType.FORGOT_PASSWORD),
        ),
      ],
    );
  }
}

TextFormField _createFormField(String label, TextEditingController controller,
    String Function(String) validator,
    {bool isPassword = false}) {
  return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey),
      ));
}
