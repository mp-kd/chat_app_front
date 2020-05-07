import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class User extends Equatable{
  String username;
  String email;
  String password;
  User({
    @required this.username,
    @required this.email,
    @required this.password
  });

  @override
  List<Object> get props => [username, email, password];
}