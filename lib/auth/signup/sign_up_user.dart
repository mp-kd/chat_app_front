
import 'package:chat_app_front/auth/user.dart';
import 'package:chat_app_front/auth/user_repository.dart';
import 'package:dartz/dartz.dart';

import '../failure.dart';

class SignUpUser{
  final UserRepository repository;
  SignUpUser(this.repository);

  Future<Either<Failure, User>>call({String username, String email, String password}) async{
    return await repository.signUpUser(username, email, password);
  }
}