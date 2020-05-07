import 'package:chat_app_front/auth/user.dart';
import 'package:chat_app_front/auth/user_repository.dart';
import 'package:flutter/cupertino.dart';

class UserModel extends User{
  UserModel({
    @required String username,
    @required String email,
    @required String password
}) : super(username: username, email: email, password: password);

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      username: json['username'],
      email: json['email'],
      password: json['password']
    );
  }
}