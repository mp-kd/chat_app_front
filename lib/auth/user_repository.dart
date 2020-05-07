import 'package:chat_app_front/auth/user.dart';
import 'package:dartz/dartz.dart';

import 'failure.dart';

abstract class UserRepository {
  Future<Either<Failure, User>>signUpUser(String username, String email, String password);
}