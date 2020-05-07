import 'package:chat_app_front/auth/signup/sign_up_keys.dart';
import 'package:chat_app_front/auth/signup/sign_up_strings.dart';
import 'package:chat_app_front/auth/user_repository_impl.dart';
import 'package:flutter/material.dart';

import 'sign_up_user.dart';
import 'validators.dart';

class SignUpForm extends StatefulWidget {
  final SignUpUser signUpUser;

  const SignUpForm({Key key, this.signUpUser}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState(signUpUser);
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatedPasswordController = TextEditingController();
  final SignUpUser signUpUser;

  _SignUpFormState(this.signUpUser);

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _repeatedPasswordController.dispose();
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
            _createTextFormField(
                SignUpKeys.usernameTextFromField,
                _usernameController,
                SignUpStrings.usernameTextFormFieldText,
                false,
                UsernameValidator.validate),
            _createTextFormField(
                SignUpKeys.emailTextFromField,
                _emailController,
                SignUpStrings.emailTextFormFieldText,
                false,
                EmailValidator.validate),
            _createTextFormField(
                SignUpKeys.passwordTextFromField,
                _passwordController,
                SignUpStrings.passwordTextFormFieldText,
                true,
                PasswordValidator.validate),
            _createTextFormField(
                SignUpKeys.repeatedPasswordTextFromField,
                _repeatedPasswordController,
                SignUpStrings.repeatPasswordTextFormFieldLText,
                true, (value) {
              return _passwordController.text != value
                  ? SignUpStrings.passwordsDifferentText
                  : null;
            }),
            Text(SignUpStrings.termsOfServiceText),
            MaterialButton(
              key: Key(SignUpKeys.submitButton),
              onPressed: () async {
                FocusScope.of(context).unfocus();
                if (_formKey.currentState.validate()) {
                  var username = _usernameController.text;
                  var email = _emailController.text;
                  var password = _passwordController.text;
                  final res = await signUpUser(
                      username: username, email: email, password: password);
                  if (res == "") {
                    _showConfirmDialog(
                        SignUpStrings.successAlertText,
                        SignUpStrings.confirmSignUpAlertText,
                        SignUpStrings.successAlertBtnText);
                  } else {
                    _showConfirmDialog(
                        SignUpStrings.failureAlertText,
                        SignUpStrings.failureSignUpText,
                        SignUpStrings.failureAlertBtnText);
                  }
                }
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField _createTextFormField(
      String key,
      TextEditingController controller,
      String decorationText,
      bool obscureText,
      Function validator) {
    return TextFormField(
      key: Key(key),
      controller: controller,
      decoration: InputDecoration(
        labelText: decorationText,
        labelStyle: TextStyle(color: Colors.grey),
      ),
      obscureText: obscureText,
      validator: validator,
    );
  }

  void _showConfirmDialog(String title, String msg, String btnMsg) {
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
