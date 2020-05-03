import 'package:chat_app_front/config.dart';
import 'package:chat_app_front/features/auth/core/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
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

  Future<int> attemptSignUp(String email, String password) async{
    var res = await http.post('$SERVER_IP/user/post',
        body: {
          "email":email,
          "password":password
    });
    return res.statusCode;
  }

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
          MaterialButton(
            onPressed: ()async{
              if(_formKey.currentState.validate()){
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('Signup in progress'),));
                  var email = emailController.text;
                  var password = passwordController.text;
                  var res = await attemptSignUp(email, password);
                  if(res == 200){
                    showDialog(context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Success'),
                      content: Text('User was created. Log in now.'),
                    ) );
                  }else{
                    showDialog(context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Failure'),
                          content: Text('Unable to create user. $res'),
                        ) );
                  }
              }
            },
            child: Text('Sign Up'),
          ),
        ],
      ),
    );
  }

}