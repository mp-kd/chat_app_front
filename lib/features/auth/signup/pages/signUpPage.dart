import 'package:chat_app_front/features/auth/signup/widget/signUpForm.dart';
import 'package:chat_app_front/features/auth/signup/widget/signUpText.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                SignUpText(),
                SignUpForm()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
