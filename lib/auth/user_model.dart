import 'package:chat_app_front/auth/user.dart';
import 'package:flutter/cupertino.dart';

class UserModel extends User{
  UserModel({
    @required String username,
    @required String email,
    @required String password
}) : super(username: username, email: email, password: password);
}