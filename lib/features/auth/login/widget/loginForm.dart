import 'package:chat_app_front/config.dart';
import 'package:chat_app_front/features/auth/core/validators.dart';
import 'package:chat_app_front/main.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget{
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<String> attemptLogIn(String email, String password) async{
    var res = await http.post(
      "$SERVER_IP/login",
      body: {
        "email": email,
        "password": password
      }
    );
    if(res.statusCode == 200) return res.body;
    return null;
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
          MaterialButton(
            onPressed: () async{
              if(_formKey.currentState.validate()){
                Scaffold.of(context).showSnackBar(SnackBar(content: Text('Login in progress'),));
                var email = emailController.text;
                var password = passwordController.text;
                var jwt = await attemptLogIn(email, password);
                if(jwt != null){
                  storage.write(key: 'jwt', value: jwt);
                  showDialog(context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Success'),
                        content: Text('Log in success'),
                      ) );
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
    );
  }

}