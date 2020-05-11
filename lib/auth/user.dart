import 'package:chat_app_front/core/response.dart';

class User {
  final String name;
  final String email;
  final String password;

  User(this.name, this.email, this.password);
}

class AuthToken {
  final String value;

  AuthToken(this.value);
}

abstract class UserFacade {
  Future<Response<void>> signUp(User user);

  Future<Response<AuthToken>> logIn(String username, String password);
}
