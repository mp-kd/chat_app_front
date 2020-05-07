
import 'package:chat_app_front/auth/signup/sign_up_page.dart';
import 'package:flutter/material.dart';


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
              MaterialButton(
                child: Text('Sign up'),
                onPressed: (){
                    Navigator.pushNamed(context, '/signup');
                  },
              ),
              MaterialButton(
                child: Text('Login'),
                onPressed: (){

                },
              ),
                ],
              ),
          ),
        ),
      );
  }
}
