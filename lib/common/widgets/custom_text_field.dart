import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//TODO: FIX controller issue
class CustomTextField extends StatefulWidget{
  final String keyStr;
  final String decorationText;
  final bool isPassword;
  final String Function(String) validator;

  CustomTextField(
      this.keyStr, this.decorationText, this.isPassword, this.validator);

  @override
  State<StatefulWidget> createState() => _CustomTextField(keyStr, decorationText, isPassword, validator);
}

class _CustomTextField extends State<CustomTextField> {
  final String keyStr;
  final String decorationText;
  final bool isPassword;
  final String Function(String) validator;

  _CustomTextField(this.keyStr, this.decorationText, this.isPassword, this.validator);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: Key(keyStr),
      obscureText: isPassword,
      validator: validator,
      decoration: InputDecoration(
        labelText: decorationText,
        labelStyle: TextStyle(color: Colors.grey),
      ),
    );
  }
}
