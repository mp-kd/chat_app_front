import 'package:chat_app_front/auth/signup/sign_up_form.dart';
import 'package:chat_app_front/auth/signup/sign_up_keys.dart';
import 'package:chat_app_front/auth/signup/sign_up_strings.dart';
import 'package:chat_app_front/auth/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'auth_mocks.dart';

main() {
  UserService mockUserService;
  NavigatorObserver mockObserver;
  setUp(() {
    mockObserver = MockNavigatorObserver();
    mockUserService = MockUserService();
  });

  Future<Null> _buildSignUpPage(WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(SignUpStrings.appBarText),
        ),
        body: Container(
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  SignUpForm(
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

  final usernameKey = Key(SignUpKeys.usernameTextFromField);
  final emailKey = Key(SignUpKeys.emailTextFromField);
  final passwordKey = Key(SignUpKeys.passwordTextFromField);
  final repeatPasswordKey = Key(SignUpKeys.repeatedPasswordTextFromField);
  final submitButtonKey = Key(SignUpKeys.submitButton);

  testWidgets("should sign up user and display confirmation dialog",
      (WidgetTester tester) async {
    //arrange
    final validUsername = "test1";
    final validEmail = "test@test.com";
    final validPassword = "zaq1@WSX";
    final validRepeatedPassword = "zaq1@WSX";
    await _buildSignUpPage(tester);
    when(mockUserService.signUpUser(any))
        .thenAnswer((_) async => UserServiceResponse.SUCCESS);

    await tester.enterText(find.byKey(usernameKey), validUsername);
    await tester.enterText(find.byKey(emailKey), validEmail);
    await tester.enterText(find.byKey(passwordKey), validPassword);
    await tester.enterText(
        find.byKey(repeatPasswordKey), validRepeatedPassword);
    //act
    await tester.tap(find.byKey(submitButtonKey));
    await tester.pumpAndSettle();
    //assert
    //TODO: check if dialog poped up
    //verify(mockObserver.didPush(any, any));
    //expect(find.text(SignUpStrings.confirmSignUpAlertText), SignUpStrings.confirmSignUpAlertText);
  });
}
