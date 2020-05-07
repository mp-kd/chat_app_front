import 'package:chat_app_front/auth/signup/sign_up_form.dart';
import 'package:chat_app_front/auth/signup/sign_up_keys.dart';
import 'package:chat_app_front/auth/signup/sign_up_strings.dart';
import 'package:chat_app_front/auth/signup/sign_up_user.dart';
import 'package:chat_app_front/auth/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockSignUpUser extends Mock implements SignUpUser {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

main() {
  SignUpUser mockSignUpUser;
  NavigatorObserver mockObserver;
  setUp(() {
    mockObserver = MockNavigatorObserver();
    mockSignUpUser = MockSignUpUser();
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
                    signUpUser: mockSignUpUser,
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

  final username1 = "test1";
  final email1 = "test@test.com";
  final password1 = "zaq1@WSX";
  final repeatPassword1 = "zaq1@WSX";
  final usernameKey = Key(SignUpKeys.usernameTextFromField);
  final emailKey = Key(SignUpKeys.emailTextFromField);
  final passwordKey = Key(SignUpKeys.passwordTextFromField);
  final repeatPasswordKey = Key(SignUpKeys.repeatedPasswordTextFromField);
  final submitButtonKey = Key(SignUpKeys.submitButton);

  testWidgets("should sign up user and display confirmation alert",
      (WidgetTester tester) async {
    //arrange
    await _buildSignUpPage(tester);
    when(mockSignUpUser()).thenAnswer((_) async => "");

    await tester.enterText(find.byKey(usernameKey), username1);
    await tester.enterText(find.byKey(emailKey), email1);
    await tester.enterText(find.byKey(passwordKey), password1);
    await tester.enterText(find.byKey(repeatPasswordKey), repeatPassword1);
    //act
    await tester.tap(find.byKey(submitButtonKey));
    await tester.pumpAndSettle();
    //assert
    //TODO: check if dialog poped up
    //verify(mockObserver.didPush(any, any));
    //expect(find.text(SignUpStrings.confirmSignUpAlertText), SignUpStrings.confirmSignUpAlertText);
  });
}
