import 'package:chat_app_front/auth/auth_widgets.dart';
import 'package:chat_app_front/auth/signup/sign_up_keys.dart';
import 'package:chat_app_front/auth/signup/sign_up_strings.dart';
import 'package:chat_app_front/auth/user.dart';
import 'package:chat_app_front/auth/user_service.dart';
import 'package:flutter/material.dart';

import 'validators.dart';

class SignUpForm extends StatefulWidget {
  final UserService userService;

  const SignUpForm({Key key, this.userService}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState(userService);
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  var _usernameController = TextEditingController();
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  var _repeatedPasswordController = TextEditingController();

  final UserService signUpUser;

  _SignUpFormState(this.signUpUser);

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            UsernameField(
              validator: UsernameValidator.validate,
              controller: _usernameController,
              key: Key(SignUpKeys.usernameTextFromField),
            ),
            EmailField(
              validator: EmailValidator.validate,
              controller: _emailController,
              key: Key(SignUpKeys.emailTextFromField),
            ),
            PasswordField(
              validator: PasswordValidator.validate,
              controller: _passwordController,
              key: Key(SignUpKeys.passwordTextFromField),
              labelText: SignUpStrings.passwordTextFormFieldText,
            ),
            PasswordField(
              controller: _repeatedPasswordController,
              key: Key(SignUpKeys.repeatedPasswordTextFromField),
              validator: (value) {
                return _passwordController.text !=
                        _repeatedPasswordController.text
                    ? SignUpStrings.passwordsDifferentText
                    : null;
              },
              labelText: SignUpStrings.repeatPasswordTextFormFieldLText,
            ),
            Text(SignUpStrings.termsOfServiceText),
            MaterialButton(
              key: Key(SignUpKeys.submitButton),
              onPressed: _onPressedSubmitButton,
              child: Text(SignUpStrings.signUpText),
            ),
          ],
        ),
      ),
    );
  }

  void _onPressedSubmitButton() async {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState.validate()) {
      var username = _usernameController.text;
      var email = _emailController.text;
      var password = _passwordController.text;
      final response = await signUpUser
          .signUpUser(User(name: username, email: email, password: password));
      String title, msgText, btnText;
      if (response == UserServiceResponse.SUCCESS) {
        title = SignUpStrings.successAlertText;
        btnText = SignUpStrings.successAlertText;
      } else {
        title = SignUpStrings.failureAlertText;
        btnText = SignUpStrings.okText;
      }
      msgText = _resolveMessage(response);
      showDialogWithBtn(context, title, msgText, btnText);
    }
  }

  String _resolveMessage(UserServiceResponse response) {
    switch (response) {
      case UserServiceResponse.SUCCESS:
        return SignUpStrings.confirmSignUpAlertText;
      case UserServiceResponse.USERNAME_ALREADY_IN_USE:
        return SignUpStrings.failureEmailAlreadyInUseSignUpText;
      case UserServiceResponse.EMAIL_ALREADY_IN_USE:
        return SignUpStrings.failureEmailAlreadyInUseSignUpText;
      case UserServiceResponse.INVALID_PASSWORD:
        return SignUpStrings.failureInvalidPasswordSignUpText;
      case UserServiceResponse.CANT_CONNECT_TO_SERVER:
        return SignUpStrings.failureCantConnectToServerSignUpText;
      default:
        return SignUpStrings.failureUnknownReasonSignUpText;
    }
  }
}
