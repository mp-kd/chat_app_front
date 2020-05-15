import 'package:chat_app_front/auth/response.dart';
import 'package:chat_app_front/auth/user_service.dart';
import 'package:flutter/material.dart';

class User {
  final String name;
  final String email;
  final String password;

  User(this.name, this.email, this.password);

  Map<String, String> toJson() => {
        'email': email,
        'name': name,
        'password': password,
      };
}

class AuthToken {
  final String value;

  AuthToken(this.value);
}

abstract class UserFacade {
  Future<Response<void>> signUp(User user);

  Future<Response<AuthToken>> logIn(String username, String password);
}

class UserServiceModel with ChangeNotifier {
  UserService userService;

  UserServiceModel(this.userService) : super();

  UserService get getUserFacade => userService;

  void changeUserService(UserService userService) {
    this.userService = userService;

    notifyListeners();
  }
}
