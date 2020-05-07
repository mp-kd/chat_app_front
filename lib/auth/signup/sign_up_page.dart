import 'package:chat_app_front/auth/signup/sign_up_strings.dart';
import 'package:flutter/material.dart';

import 'sign_up_form.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(SignUpStrings.appBarText),),
      body: Container(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                SignUpForm()
              ],
            ),
          ],
        ),
      ),
    );
  }
}