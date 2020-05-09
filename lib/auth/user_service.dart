import 'package:chat_app_front/auth/user.dart';

abstract class UserService {
  Future<UserServiceResponse> signUpUser(User user);

  Future<UserServiceResponse> loginUser(User user) {}
}

enum UserServiceResponse {
  SUCCESS,
  USERNAME_ALREADY_IN_USE,
  EMAIL_ALREADY_IN_USE,
  INVALID_PASSWORD,
  CANT_CONNECT_TO_SERVER,
  UNKNOWN_REASON,
  WRONG_USERNAME_OR_PASSWORD
}
