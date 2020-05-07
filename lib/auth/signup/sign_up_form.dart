import 'package:chat_app_front/auth/signup/sign_up_keys.dart';
import 'package:chat_app_front/auth/signup/sign_up_strings.dart';
import 'package:chat_app_front/auth/user_repository_impl.dart';
import 'package:flutter/material.dart';

import 'sign_up_user.dart';
import 'validators.dart';

class SignUpForm extends StatefulWidget{
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
  void dispose(){
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
            TextFormField(
              key: Key(SignUpKeys.usernameTextFromField),
              controller: _usernameController,
              validator: UsernameValidator.validate,
              decoration: InputDecoration(
                  labelText: SignUpStrings.usernameTextFormFieldText,
                  labelStyle: TextStyle(
                      color: Colors.grey
                  )
              ),
            ),
            TextFormField(
              key: Key(SignUpKeys.emailTextFromField),
              controller: _emailController,
              validator: EmailValidator.validate,
              decoration: InputDecoration(
                  labelText: SignUpStrings.emailTextFormFieldText,
                  labelStyle: TextStyle(
                      color: Colors.grey
                  )
              ),
            ),
            TextFormField(
              key: Key(SignUpKeys.passwordTextFromField),
              controller: _passwordController,
              validator: PasswordValidator.validate,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                      color: Colors.grey
                  )
              ),
            ),
            TextFormField(
              key: Key(SignUpKeys.repeatedPasswordTextFromField),
              validator: (value) {
                if(_passwordController.text != value){
                  return "Passwords doesn't match";
                }
                else{
                  return null;
                }
              },
              controller: _repeatedPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Repeat password',
                  labelStyle: TextStyle(
                      color: Colors.grey
                  )
              ),
            ),
            Text(SignUpStrings.termsOfServiceText),
            MaterialButton(
              key: Key(SignUpKeys.submitButton),
              onPressed: ()async{
                FocusScope.of(context).unfocus();
                if(_formKey.currentState.validate()){
                  var username = _usernameController.text;
                  var email = _emailController.text;
                  var password = _passwordController.text;
                  final res = await signUpUser(username: username, email: email, password: password);
                  if(res == ""){
                    _showConfirmDialog(SignUpStrings.confirmSignUpAlertText);
                  }else{
                    _showConfirmDialog(res);
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

  void _showConfirmDialog(String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Success"),
          content: new Text(msg),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new MaterialButton(
              child: new Text("Ok"),
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

