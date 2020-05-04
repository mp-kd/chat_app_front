import 'package:chat_app_front/auth/auth_service.dart';
import 'package:chat_app_front/config.dart';
import 'package:chat_app_front/main.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../user.dart';

class LoginForm extends StatefulWidget{
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                  labelText: 'E-mail',
                  labelStyle: TextStyle(
                      color: Colors.grey
                  )
              ),
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                      color: Colors.grey
                  )
              ),
            ),
            MaterialButton(
              onPressed: () async{
                FocusScope.of(context).unfocus();
                if(_formKey.currentState.validate()){
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('Login in progress'),));
                  var email = _emailController.text;
                  var password = _passwordController.text;
                  var jwt = await AuthService.attemptLogIn(User(email, password));
                  if(jwt != null){
                    storage.write(key: 'jwt', value: jwt);
                    showDialog(context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Success'),
                          content: Text('Log in success'),
                        ) );
                    _emailController.text = "";
                    _passwordController.text = "";
                    //TODO: route to another page
                  }else{
                    showDialog(context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Failure'),
                          content: Text('Unable to log in'),
                        ) );
                  }
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

}