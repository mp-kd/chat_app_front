import 'package:chat_app_front/auth/widgets/auth_buttons.dart';
import 'package:chat_app_front/auth/widgets/auth_label_keys.dart';
import 'package:chat_app_front/auth/widgets/validators.dart';
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

abstract class AuthForm extends StatefulWidget {
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

  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
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

  void _resetPasswordButtonAction() {}
}

class SignUpForm extends AuthForm {
  SignUpForm() : super._();

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController repeatPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: _createFormField(
                context,
                GlobalLocalizations.of(context).translate(AuthLabelKeys.email),
                emailController,
                Validator(ValidatorType.EMAIL, context).validate),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: _createFormField(
                context,
                GlobalLocalizations.of(context)
                    .translate(AuthLabelKeys.username),
                usernameController,
                Validator(ValidatorType.USERNAME, context).validate),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Text(GlobalLocalizations.of(context).translate(AuthLabelKeys.usernamePolicy),
            style: TextStyle(
              color: Theme.of(context).accentTextTheme.caption.color,
              fontSize: 8
            ),),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: _createFormField(
                context,
                GlobalLocalizations.of(context)
                    .translate(AuthLabelKeys.password),
                passwordController,
                Validator(ValidatorType.PASSWORD, context).validate,
                isPassword: true),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Text(GlobalLocalizations.of(context).translate(AuthLabelKeys.passwordPolicy),
              style: TextStyle(
                  color: Theme.of(context).accentTextTheme.caption.color,
                  fontSize: 8
              ),),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: _createFormField(
                context,
                GlobalLocalizations.of(context)
                    .translate(AuthLabelKeys.repeatPassword),
                repeatPasswordController,
                (value) => value != passwordController.text
                    ? GlobalLocalizations.of(context)
                        .translate(AuthLabelKeys.passwordsDifferent)
                    : null,
                isPassword: true),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              GlobalLocalizations.of(context)
                  .translate(AuthLabelKeys.termsOfService),
              style: Theme.of(context).primaryTextTheme.caption,
            ),
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

  void _signUpButtonAction() {
    if(_formKey.currentState.validate()){

    }
  }
}

class LoginForm extends AuthForm {
  LoginForm() : super._();

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Form(
          key: _formKey,
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
                    Validator(ValidatorType.NOT_EMPTY, context).validate),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                child: _createFormField(
                    context,
                    GlobalLocalizations.of(context)
                        .translate(AuthLabelKeys.password),
                    passwordController,
                    Validator(ValidatorType.NOT_EMPTY, context).validate,
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

  void _loginButtonAction() {
    if(_formKey.currentState.validate()){

    }
  }
}

TextFormField _createFormField(BuildContext context, String label,
    TextEditingController controller, String Function(String) validator,
    {bool isPassword = false}) {
  return TextFormField(
      controller: controller,
      validator: validator,
      // autovalidate validates immediately on field load, not after first change
      autovalidate: false,
      obscureText: isPassword,
      style: Theme.of(context).primaryTextTheme.button,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).accentTextTheme.caption.color)),
        labelText: label,
        labelStyle: Theme.of(context).accentTextTheme.button,
      ));
}
