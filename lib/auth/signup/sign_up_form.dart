import 'package:chat_app_front/auth/signup/sign_up_strings.dart';
import 'package:chat_app_front/auth/user_repository_impl.dart';
import 'package:flutter/material.dart';

import 'sign_up_user.dart';
import 'validators.dart';

class SignUpForm extends StatefulWidget{
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatedPasswordController = TextEditingController();

  @override
  void dispose(){
    _emailController.dispose();
    _usernameController.dispose();
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
              controller: _usernameController,
              validator: UsernameValidator.validate,
              decoration: InputDecoration(
                  labelText: SignUpStrings.usernameTextFormFieldText,
                  labelStyle: TextStyle(
                      color: Colors.grey
                  )
              ),
            ),
            TextFormField(
              controller: _emailController,
              validator: EmailValidator.validate,
              decoration: InputDecoration(
                  labelText: SignUpStrings.emailTextFormFieldText,
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
            Text(SignUpStrings.termsOfServiceText),
            MaterialButton(
              onPressed: ()async{
                FocusScope.of(context).unfocus();
                if(_formKey.currentState.validate()){
                  var username = _usernameController.text;
                  var email = _emailController.text;
                  var password = _passwordController.text;
                  final signupUseCase = SignUpUser(UserRepositoryImpl());
                  final res = await signupUseCase(username: username, email: email, password: password);
                  if(res == ""){
                    //TODO: confirmation and possible errors dialogs
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