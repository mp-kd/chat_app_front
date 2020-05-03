import 'package:chat_app_front/features/auth/signup/pages/signUpPage.dart';
import 'package:flutter/material.dart';

import 'features/auth/login/pages/loginPage.dart';

class HomePage extends StatefulWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          child: ListView(
            children: <Widget>[
              RaisedButton(
                child: Text('Sign up'),
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpPage()));
                  },
              ),
              RaisedButton(
                child: Text('Login'),
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
              ),
                ],
              ),
          ),
        ),
      );
  }
}
