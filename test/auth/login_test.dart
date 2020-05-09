import 'package:chat_app_front/auth/login/login_form.dart';
import 'package:chat_app_front/auth/login/login_keys.dart';
import 'package:chat_app_front/auth/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'auth_mocks.dart';

//TODO: find way to use routes in test
main() {
  UserService mockUserService;
  NavigatorObserver mockObserver;
  setUp(() {
    mockObserver = MockNavigatorObserver();
    mockUserService = MockUserService();
  });

  Future<Null> _buildLoginPage(WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Container(
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  LoginForm(
                    userService: mockUserService,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      navigatorObservers: [mockObserver],
    ));
    verify(mockObserver.didPush(any, any));
  }

  final usernameKey = Key(LoginKeys.usernameTextFromField);
  final passwordKey = Key(LoginKeys.passwordTextFromField);
  final submitButtonKey = Key(LoginKeys.submitButton);

  testWidgets("should login user and display welcome page",
      (WidgetTester tester) async {
    //arrange
    final validUsername = "test1";
    final validPassword = "zaq1@WSX";
    await _buildLoginPage(tester);
    when(mockUserService.loginUser(any))
        .thenAnswer((_) async => UserServiceResponse.SUCCESS);

    await tester.enterText(find.byKey(usernameKey), validUsername);
    await tester.enterText(find.byKey(passwordKey), validPassword);
    //act
    await tester.tap(find.byKey(submitButtonKey));
    await tester.pumpAndSettle();
    //assert
    verify(mockObserver.didPush(any, any));
  });
}
