import 'package:chat_app_front/auth/login/login_keys.dart';
import 'package:chat_app_front/auth/login/login_strings.dart';
import 'package:chat_app_front/auth/user.dart';
import 'package:chat_app_front/auth/user_service.dart';
import 'package:flutter/material.dart';

import '../auth_widgets.dart';

class LoginForm extends StatefulWidget {
  final UserService userService;

  const LoginForm({Key key, this.userService}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginFormState(userService);
}

class _LoginFormState extends State<LoginForm> {
  final UserService userService;
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  _LoginFormState(this.userService);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            UsernameField(
              controller: _usernameController,
              key: Key(LoginKeys.usernameTextFromField),
              validator: (value) => value.isEmpty ? LoginStrings.loginCantBeEmpty:null,
            ),
            PasswordField(
              controller: _passwordController,
              key: Key(LoginKeys.passwordTextFromField),
              validator: (value) => null,
              labelText: LoginStrings.passwordTextFormFieldText,
            ),
            MaterialButton(
              key: Key(LoginKeys.submitButton),
              onPressed: _onPressedLoginButton,
              child: Text(LoginStrings.loginButtonTxt),
            ),
          ],
        ),
      ),
    );
  }

  _onPressedLoginButton() async {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState.validate()) {
      final response = await userService.loginUser(User(
          name: _usernameController.text, password: _passwordController.text, email: ""));
      if (response == UserServiceResponse.SUCCESS) {
        Navigator.pushNamed(context, '/welcome_page');
      }
      else {
        showDialogWithBtn(context, LoginStrings.failureText,
            _resolveMessage(response), LoginStrings.okText);
      }
    }
  }

  _resolveMessage(UserServiceResponse response){
    switch (response) {
      case UserServiceResponse.WRONG_USERNAME_OR_PASSWORD:
        return LoginStrings.invalidUserPasswordText;
      case UserServiceResponse.CANT_CONNECT_TO_SERVER:
        return LoginStrings.connectionIssuesText;
      default:
        return LoginStrings.failureMsgText;
    }
  }
}
