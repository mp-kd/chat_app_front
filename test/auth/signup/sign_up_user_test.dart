import 'package:chat_app_front/auth/signup/sign_up_user.dart';
import 'package:chat_app_front/auth/user.dart';
import 'package:chat_app_front/auth/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';


class MockUserRepository extends Mock implements UserRepository{}

void main(){
  MockUserRepository mockUserRepository;
  SignUpUser signUpUserUsecase;

  setUp((){
    mockUserRepository = MockUserRepository();
    signUpUserUsecase = SignUpUser(mockUserRepository);
  });

  final username1 = "test1";
  final email1 = "test@test.com";
  final password1 = "zaq1@WSX";
  final user1 = User(name: username1, email: email1, password: password1);
  test("should sign up user and return empty message", () async{
    //arrange
    when(mockUserRepository.signUpUser(any))
        .thenAnswer((_) async => "");
    //act
    final result = await signUpUserUsecase(username: username1, email: email1, password: password1);
    //assert
    expect(result, "");
    verify(mockUserRepository.signUpUser(user1));
    verifyNoMoreInteractions(mockUserRepository);
  });
}