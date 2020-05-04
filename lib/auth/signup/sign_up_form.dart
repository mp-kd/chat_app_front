import 'package:chat_app_front/auth/auth_service.dart';
import 'package:chat_app_front/auth/user.dart';
import 'package:chat_app_front/auth/signup/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget{
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatedPasswordController = TextEditingController();

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    _repeatedPasswordController.dispose();
    super.dispose();
  }

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
              validator: EmailValidator.validate,
              decoration: InputDecoration(
                  labelText: 'E-mail',
                  labelStyle: TextStyle(
                      color: Colors.grey
                  )
              ),
            ),
            TextFormField(
              controller: _passwordController,
              validator: PasswordValidator.validate,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                      color: Colors.grey
                  )
              ),
            ),
            TextFormField(
              validator: (value) {
                if(_passwordController.text != value){
                  return "Passwords doesn't match";
                }
                else{
                  return null;
                }
              },
              controller: _repeatedPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Repeat password',
                  labelStyle: TextStyle(
                      color: Colors.grey
                  )
              ),
            ),
            MaterialButton(
              onPressed: ()async{
                FocusScope.of(context).unfocus();
                if(_formKey.currentState.validate()){
                    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Signup in progress'),));
                    var email = _emailController.text;
                    var password = _passwordController.text;
                    var res = await AuthService.attemptSignUp(User(email, password));
                    if(res == 200){
                      showDialog(context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Success'),
                        content: Text('User was created. Log in now.'),
                      ));
                      _emailController.text = "";
                      _passwordController.text = "";
                      _repeatedPasswordController.text = "";
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
      ),
    );
  }

}