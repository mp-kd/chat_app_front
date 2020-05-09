import 'package:chat_app_front/auth/login/login_form.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../user_service.dart';
import '../user_service_impl.dart';
import 'login_strings.dart';

class LoginPage extends StatefulWidget {
  final UserService userService = UserServiceImpl();

  @override
  State<StatefulWidget> createState() => _LoginPageState(userService);
}

class _LoginPageState extends State<LoginPage> {
  final UserService userService;

  _LoginPageState(this.userService);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LoginStrings.appBarText),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                LoginForm(
                  userService: userService,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: LoginStrings.notMemberText,
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                      TextSpan(
                          text: LoginStrings.signUpText,
                          style: TextStyle(color: Colors.blue, fontSize: 12),
                          recognizer: TapGestureRecognizer()
                            ..onTap = (() {
                              Navigator.pushNamed(context, '/signup');
                            })),
                      TextSpan(
                          text: LoginStrings.nowText,
                          style: TextStyle(color: Colors.grey, fontSize: 12))
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
