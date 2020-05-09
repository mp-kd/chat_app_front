import 'package:chat_app_front/auth/signup/sign_up_strings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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

class UsernameField extends StatefulWidget {
  final TextEditingController controller;
  final String Function(String) validator;

  const UsernameField({Key key, this.controller, this.validator})
      : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _UsernameState(controller, validator);
}

class _UsernameState extends State<UsernameField> {
  final TextEditingController controller;
  final String Function(String) validator;

  _UsernameState(this.controller, this.validator);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
          labelText: SignUpStrings.usernameTextFormFieldText,
          labelStyle: TextStyle(color: Colors.grey)),
    );
  }
}

class EmailField extends StatefulWidget {
  final TextEditingController controller;
  final String Function(String) validator;

  const EmailField({Key key, this.controller, this.validator})
      : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _EmailFieldState(controller, validator);
}

class _EmailFieldState extends State<EmailField> {
  final TextEditingController controller;
  final String Function(String) validator;

  _EmailFieldState(this.controller, this.validator);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
          labelText: SignUpStrings.emailTextFormFieldText,
          labelStyle: TextStyle(color: Colors.grey)),
    );
  }
}

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String Function(String) validator;
  final String labelText;

  const PasswordField({Key key, this.controller, this.validator, this.labelText})
      : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _PasswordFieldState(controller, validator, labelText);
}

class _PasswordFieldState extends State<PasswordField> {
  final TextEditingController controller;
  final String Function(String) validator;
  final String labelText;
  _PasswordFieldState(this.controller, this.validator, this.labelText);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.grey)),
    );
  }
}