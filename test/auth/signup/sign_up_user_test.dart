import 'package:chat_app_front/auth/user.dart';
import 'package:chat_app_front/auth/user_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockUserRepository extends Mock implements UserService {}

void main() {
  MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
  });

  test("should sign up user and return empty message", () async {
    //arrange
    final validUsername = "test123";
    final validEmail = "test@test.com";
    final validPassword = "zaq1@WSX";
    final user1 =
        User(name: validUsername, email: validEmail, password: validPassword);
    when(mockUserRepository.signUpUser(any))
        .thenAnswer((_) async => UserServiceResponse.SUCCESS);
    //act
    final result = await mockUserRepository.signUpUser(user1);
    //assert
    expect(result, UserServiceResponse.SUCCESS);
    verify(mockUserRepository.signUpUser(user1));
    verifyNoMoreInteractions(mockUserRepository);
  });
}
