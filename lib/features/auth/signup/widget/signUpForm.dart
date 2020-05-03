
import 'package:chat_app_front/features/auth/core/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget{
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatedPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: emailController,
            validator: EmailValidator.validate,
            decoration: InputDecoration(
                labelText: 'E-mail',
                labelStyle: TextStyle(
                    color: Colors.amber
                )
            ),
          ),
          TextFormField(
            controller: passwordController,
            validator: PasswordValidator.validate,
            obscureText: true,
            decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(
                    color: Colors.amber
                )
            ),
          ),
          TextFormField(
            validator: (value) {
              if(passwordController.text != value){
                return "Passwords doesn't match";
              }
              else{
                return null;
              }
            },
            controller: repeatedPasswordController,
            obscureText: true,
            decoration: InputDecoration(
                labelText: 'Repeat password',
                labelStyle: TextStyle(
                    color: Colors.amber
                )
            ),
          ),
          RaisedButton(
            onPressed: (){
              if(_formKey.currentState.validate()){
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('Processing Data'),));
              }
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }

}