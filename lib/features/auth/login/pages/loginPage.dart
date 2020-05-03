import 'package:chat_app_front/features/auth/login/widget/loginForm.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Log In'),),
      body: Container(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                LoginForm()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
