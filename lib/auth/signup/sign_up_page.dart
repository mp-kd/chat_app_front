import 'package:chat_app_front/auth/signup/sign_up_strings.dart';
import 'package:chat_app_front/auth/user_repository.dart';
import 'package:chat_app_front/auth/user_repository_impl.dart';
import 'package:flutter/material.dart';

import 'sign_up_form.dart';
import 'sign_up_user.dart';

class SignUpPage extends StatefulWidget {
  final UserRepository userRepository = UserRepositoryImpl();

  @override
  _SignUpPageState createState() => _SignUpPageState(userRepository);
}

class _SignUpPageState extends State<SignUpPage> {
  final UserRepository userRepository;

  _SignUpPageState(this.userRepository);

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
                  signUpUser: SignUpUser(userRepository),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: SignUpStrings.alreadyMemberText,
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                      TextSpan(
                          text: SignUpStrings.loginText,
                          style: TextStyle(color: Colors.blue, fontSize: 12))
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
