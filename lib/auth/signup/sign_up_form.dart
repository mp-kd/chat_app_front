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
            createTextFormField(
                SignUpKeys.usernameTextFromField,
                SignUpStrings.usernameTextFormFieldText,
                false,
                UsernameValidator.validate,
                _usernameController),
            createTextFormField(
                SignUpKeys.emailTextFromField,
                SignUpStrings.emailTextFormFieldText,
                false,
                EmailValidator.validate,
                _emailController),
            createTextFormField(
                SignUpKeys.passwordTextFromField,
                SignUpStrings.passwordTextFormFieldText,
                true,
                PasswordValidator.validate,
                _passwordController),
            createTextFormField(SignUpKeys.repeatedPasswordTextFromField,
                SignUpStrings.repeatPasswordTextFormFieldLText, true, (value) {
              return _passwordController.text !=
                      _repeatedPasswordController.text
                  ? SignUpStrings.passwordsDifferentText
                  : null;
            }, _repeatedPasswordController),
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

  void _onPressedSubmitButton() async {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState.validate()) {
      var username = _usernameController.text;
      var email = _emailController.text;
      var password = _passwordController.text;
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
      showDialogWithBtn(context, title, msgText, btnText);
    }
  }
}
