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
            createTextFormField(
                LoginKeys.usernameTextFromField,
                LoginStrings.usernameTextFormFieldText,
                false,
                (value) => null,
                _usernameController),
            createTextFormField(
                LoginKeys.passwordTextFromField,
                LoginStrings.passwordTextFormFieldText,
                true,
                (value) => null,
                _passwordController),
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
          name: _usernameController.text, password: _passwordController.text));
      switch (response) {
        case UserServiceResponse.SUCCESS:
          Navigator.pushNamed(context, '/welcome_page');
          break;
        case UserServiceResponse.WRONG_USERNAME_OR_PASSWORD:
          showDialogWithBtn(context, LoginStrings.failureText,
              LoginStrings.invalidUserPasswordText, LoginStrings.okText);
          break;
        case UserServiceResponse.CANT_CONNECT_TO_SERVER:
          showDialogWithBtn(context, LoginStrings.failureText,
              LoginStrings.connectionIssuesText, LoginStrings.okText);
          break;
        default:
          showDialogWithBtn(context, LoginStrings.failureText,
              LoginStrings.failureMsgText, LoginStrings.okText);
          break;
      }
    }
  }
}
