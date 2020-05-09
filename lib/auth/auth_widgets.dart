import 'package:chat_app_front/auth/signup/sign_up_strings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

TextFormField createTextFormField(String key, String decorationText,
    bool obscureText, Function validator, TextEditingController controller) {
  return TextFormField(
    controller: controller,
    key: Key(key),
    decoration: InputDecoration(
      labelText: decorationText,
      labelStyle: TextStyle(color: Colors.grey),
    ),
    obscureText: obscureText,
    validator: validator,
  );
}

void showDialogWithBtn(
    BuildContext context, String title, String msg, String btnMsg) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: new Text(title),
        content: new Text(msg),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new MaterialButton(
            child: new Text(btnMsg),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class UsernameField implements TextFormField {
  final TextFormField _textFormField;

  UsernameField(String Function(String) validator, String key)
      : _textFormField = TextFormField(
          validator: validator,
          key: Key(key),
          decoration: InputDecoration(
            labelText: SignUpStrings.usernameTextFormFieldText,
            labelStyle: TextStyle(
              color: Colors.grey,
            ),
          ),
        );

  @override
  bool get autovalidate => _textFormField.autovalidate;

  @override
  get builder => _textFormField.builder;

  @override
  TextEditingController get controller => _textFormField.controller;

  @override
  StatefulElement createElement() => _textFormField.createElement();

  @override
  createState() => _textFormField.createState();

  @override
  List<DiagnosticsNode> debugDescribeChildren() =>
      _textFormField.debugDescribeChildren();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) =>
      _textFormField.debugFillProperties(properties);

  @override
  bool get enabled => _textFormField.enabled;

  @override
  String get initialValue => _textFormField.initialValue;

  @override
  Key get key => _textFormField.key;

  @override
  get onSaved => _textFormField.onSaved;

  @override
  DiagnosticsNode toDiagnosticsNode(
          {String name, DiagnosticsTreeStyle style}) =>
      _textFormField.toDiagnosticsNode(name: name, style: style);

  @override
  String toStringDeep(
          {String prefixLineOne = '',
          String prefixOtherLines,
          DiagnosticLevel minLevel = DiagnosticLevel.debug}) =>
      _textFormField.toStringDeep(
          prefixLineOne: prefixLineOne,
          prefixOtherLines: prefixOtherLines,
          minLevel: minLevel);

  @override
  String toStringShallow(
          {String joiner = ', ',
          DiagnosticLevel minLevel = DiagnosticLevel.debug}) =>
      _textFormField.toStringShallow(joiner: joiner, minLevel: minLevel);

  @override
  String toStringShort() => _textFormField.toStringShort();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) =>
      _textFormField.toString(minLevel: minLevel);

  @override
  get validator => _textFormField.validator;
}
