import 'package:chat_app_front/auth/signup/sign_up_form.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up'),),
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
