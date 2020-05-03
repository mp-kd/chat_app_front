
import 'package:flutter/material.dart';

class SignUpText extends StatefulWidget{
  @override
  _SignUpTextState createState() => _SignUpTextState();
}

class _SignUpTextState extends State<SignUpText> {
  @override
  Widget build(BuildContext context){
    return Text(
      'Sign Up',
      style: TextStyle(
        fontSize: 24,
      ),
    );
  }
}