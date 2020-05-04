
import 'package:chat_app_front/auth/signup/validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  test('should return message that email cant be empty', (){
    //arrange
    final String email = '';
    //act
    final String result = EmailValidator.validate(email);
    //assert
    expect(result, EmailValidator.emailCantBeEmpty);
  },);

  test('should return message that email is invalid format', (){
    //arrange
    final String email = "randommail";
    //act
    final String result = EmailValidator.validate(email);
    //assert
    expect(result, EmailValidator.emailInvalidFormat);

  },);

  test('should return message that email is invalid format', (){
    //arrange
    final String email = "bad mail@a.com";
    //act
    final String result = EmailValidator.validate(email);
    //assert
    expect(result, EmailValidator.emailInvalidFormat);

  },);

  test('should return message that email is invalid format', (){
    //arrange
    final String email = "badmail@a";
    //act
    final String result = EmailValidator.validate(email);
    //assert
    expect(result, EmailValidator.emailInvalidFormat);

  },);


  test('should return message that email is invalid format', (){
    //arrange
    final String email = "badmail@.c";
    //act
    final String result = EmailValidator.validate(email);
    //assert
    expect(result, EmailValidator.emailInvalidFormat);

  },);

  test('should return null', (){
    //arrange
    final String email = "goodmail@gmail.com";
    //act
    final String result = EmailValidator.validate(email);
    //assert
    expect(result, null);
  },);

  test('should return null', (){
    //arrange
    final String email = "asdad@abc.xdd";
    //act
    final String result = EmailValidator.validate(email);
    //assert
    expect(result, null);
  },);
}