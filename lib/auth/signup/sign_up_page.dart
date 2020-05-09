import 'package:chat_app_front/auth/signup/sign_up_strings.dart';
import 'package:chat_app_front/auth/user_service.dart';
import 'package:chat_app_front/auth/user_service_impl.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'sign_up_form.dart';

class SignUpPage extends StatefulWidget {
  final UserService userService = UserServiceImpl();

  @override
  _SignUpPageState createState() => _SignUpPageState(userService);
}

class _SignUpPageState extends State<SignUpPage> {
  final UserService userService;

  _SignUpPageState(this.userService);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SignUpStrings.appBarText),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                SignUpForm(
                  userService: userService,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: SignUpStrings.alreadyMemberText,
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                      TextSpan(
                        text: SignUpStrings.loginText,
                        style: TextStyle(color: Colors.blue, fontSize: 12),
                        recognizer: TapGestureRecognizer()
                          ..onTap = (() {
                            Navigator.pushNamed(context, '/login');
                          }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
