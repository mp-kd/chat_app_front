import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class User extends Equatable{
  final String name;
  final String email;
  final String password;
  User({
    @required this.name,
    @required this.email,
    @required this.password
  });

  Map<String, String> toJson()=> {
    "email":email,
    "name":name,
    "password": password
  };

  factory User.fromJson(Map<String, dynamic> json){
    return User(
        name: json['name'],
        email: json['email'],
        password: json['password']
    );
  }
  @override
  List<Object> get props => [name, email, password];
}