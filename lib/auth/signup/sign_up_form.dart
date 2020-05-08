import 'package:chat_app_front/auth/signup/sign_up_keys.dart';
import 'package:chat_app_front/auth/signup/sign_up_strings.dart';
import 'package:chat_app_front/auth/user.dart';
import 'package:chat_app_front/auth/user_service.dart';
import 'package:flutter/material.dart';

import 'validators.dart';

class SignUpForm extends StatefulWidget {
  final UserService userRepository;

  const SignUpForm({Key key, this.userRepository}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState(userRepository);
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameTextField = _createTextFormField(
      SignUpKeys.usernameTextFromField,
      SignUpStrings.usernameTextFormFieldText,
      false,
      UsernameValidator.validate);
  final _emailTextField = _createTextFormField(SignUpKeys.emailTextFromField,
      SignUpStrings.emailTextFormFieldText, false, EmailValidator.validate);
  final _passwordTextField = _createTextFormField(
      SignUpKeys.passwordTextFromField,
      SignUpStrings.passwordTextFormFieldText,
      true,
      PasswordValidator.validate);
  final _repeatedPasswordTextField = _createTextFormField(
      SignUpKeys.repeatedPasswordTextFromField,
      SignUpStrings.repeatPasswordTextFormFieldLText,
      true, (value) {
        //TODO: cant use static _passwordTextField
        return null;
  });

  final UserService signUpUser;

  _SignUpFormState(this.signUpUser);

  @override
  void dispose() {
    super.dispose();
  }

  //TODO:

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            _usernameTextField,
            _emailTextField,
            _passwordTextField,
            _repeatedPasswordTextField,
            Text(SignUpStrings.termsOfServiceText),
            MaterialButton(
              key: Key(SignUpKeys.submitButton),
              onPressed: _onPressedSubmitButton,
              child: Text(SignUpStrings.signUpButtonText),
            ),
          ],
        ),
      ),
    );
  }

  static TextFormField _createTextFormField(
      String key, String decorationText, bool obscureText, Function validator) {
    return TextFormField(
      key: Key(key),
      decoration: InputDecoration(
        labelText: decorationText,
        labelStyle: TextStyle(color: Colors.grey),
      ),
      obscureText: obscureText,
      validator: validator,
    );
  }

  void _onPressedSubmitButton() async {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState.validate()) {
      var username = _usernameTextField.controller.text;
      var email = _emailTextField.controller.text;
      var password = _passwordTextField.controller.text;
      final response = await signUpUser
          .signUpUser(User(name: username, email: email, password: password));

      String title, msgText, btnText;
      switch (response) {
        case UserServiceResponse.SUCCESS:
          title = SignUpStrings.successAlertText;
          msgText = SignUpStrings.confirmSignUpAlertText;
          btnText = SignUpStrings.successAlertBtnText;
          break;
        case UserServiceResponse.USERNAME_ALREADY_IN_USE:
          title = SignUpStrings.failureAlertText;
          msgText = SignUpStrings.failureUsernameAlreadyInUseSignUpText;
          btnText = SignUpStrings.failureAlertBtnText;
          break;
        case UserServiceResponse.EMAIL_ALREADY_IN_USE:
          title = SignUpStrings.failureAlertText;
          msgText = SignUpStrings.failureEmailAlreadyInUseSignUpText;
          btnText = SignUpStrings.failureAlertBtnText;
          break;
        case UserServiceResponse.INVALID_PASSWORD:
          title = SignUpStrings.failureAlertText;
          msgText = SignUpStrings.failureInvalidPasswordSignUpText;
          btnText = SignUpStrings.failureAlertBtnText;
          break;
        case UserServiceResponse.CANT_CONNECT_TO_SERVER:
          title = SignUpStrings.failureAlertText;
          msgText = SignUpStrings.failureCantConnectToServerSignUpText;
          btnText = SignUpStrings.failureAlertBtnText;
          break;
        case UserServiceResponse.UNKNOWN_REASON:
          title = SignUpStrings.failureAlertText;
          msgText = SignUpStrings.failureUnknownReasonSignUpText;
          btnText = SignUpStrings.failureAlertBtnText;
          break;
        default:
          title = SignUpStrings.failureAlertText;
          msgText = SignUpStrings.failureUnknownReasonSignUpText;
          btnText = SignUpStrings.failureAlertBtnText;
          break;
      }
      _showDialog(context, title, msgText, btnText);
    }
  }

  static void _showDialog(
      BuildContext context, String title, String msg, String btnMsg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(title),
          content: new Text(msg),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new MaterialButton(
              child: new Text(btnMsg),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
