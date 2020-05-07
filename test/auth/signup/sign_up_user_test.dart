import 'package:chat_app_front/auth/signup/sign_up_user.dart';
import 'package:chat_app_front/auth/user.dart';
import 'package:chat_app_front/auth/user_repository.dart';
import 'package:dartz/dartz.dart';
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
  final user = User(username:"test1", email:"test@test.com", password:"zaq1@WSX");

  test("should sign up user and return user", () async{
    //arrange
    when(mockUserRepository.signUpUser(any, any, any))
        .thenAnswer((_) async => Right(user));
    //act
    final result = await signUpUserUsecase(username: username1, email: email1, password: password1);
    //assert
    expect(result, Right(user));
    verify(mockUserRepository.signUpUser(username1, email1, password1));
    verifyNoMoreInteractions(mockUserRepository);
  });
}