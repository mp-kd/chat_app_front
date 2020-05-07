import 'package:chat_app_front/auth/user.dart';
import 'package:dartz/dartz.dart';

import '../common/failure.dart';

abstract class UserRepository {
  Future<String> signUpUser(User user);
}
