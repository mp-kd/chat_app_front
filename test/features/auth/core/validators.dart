
import 'package:chat_app_front/features/auth/core/validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  test('EmailValidator should return message that email cant be empty', (){
    //arrange
    final String email = '';
    //act
    final String result = EmailValidator.validate(email);
    //assert
    expect(result, EmailValidator.EMAIL_CANT_BE_EMPTY);
  },);

  test('EmailValidator should return message that email is invalid format', (){
    //arrange
    final String email = "randommail";
    //act
    final String result = EmailValidator.validate(email);
    //assert
    expect(result, EmailValidator.EMAIL_INVALID_FORMAT);

  },);

  test('EmailValidator should return message that email is invalid format', (){
    //arrange
    final String email = "bad mail@a.com";
    //act
    final String result = EmailValidator.validate(email);
    //assert
    expect(result, EmailValidator.EMAIL_INVALID_FORMAT);

  },);

  test('EmailValidator should return message that email is invalid format', (){
    //arrange
    final String email = "badmail@a";
    //act
    final String result = EmailValidator.validate(email);
    //assert
    expect(result, EmailValidator.EMAIL_INVALID_FORMAT);

  },);


  test('EmailValidator should return message that email is invalid format', (){
    //arrange
    final String email = "badmail@.c";
    //act
    final String result = EmailValidator.validate(email);
    //assert
    expect(result, EmailValidator.EMAIL_INVALID_FORMAT);

  },);

  test('EmailValidator should return null', (){
    //arrange
    final String email = "goodmail@gmail.com";
    //act
    final String result = EmailValidator.validate(email);
    //assert
    expect(result, null);
  },);

  test('EmailValidator should return null', (){
    //arrange
    final String email = "asdad@abc.xdd";
    //act
    final String result = EmailValidator.validate(email);
    //assert
    expect(result, null);
  },);
}