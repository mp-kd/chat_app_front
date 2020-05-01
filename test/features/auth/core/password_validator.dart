
import 'package:chat_app_front/features/auth/core/validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test('PasswordValidator should return null', (){
    //arrange
    final String passw = "zaq1@WSX";
    //act
    final String result = PasswordValidator.validate(passw);
    //assert
    expect(result, null);
  },);

  test('PasswordValidator should return null', (){
    //arrange
    final String passw = "Hwdp!234";
    //act
    final String result = PasswordValidator.validate(passw);
    //assert
    expect(result, null);
  },);


  test('PasswordValidator should return invalid format', (){
    //arrange
    final String passw = "hwdp!234";
    //act
    final String result = PasswordValidator.validate(passw);
    //assert
    expect(result, PasswordValidator.passwordInvalidFormat);
  },);


  test('PasswordValidator should return invalid format', (){
    //arrange
    final String passw = "asd";
    //act
    final String result = PasswordValidator.validate(passw);
    //assert
    expect(result, PasswordValidator.passwordInvalidFormat);
  },);


  test('PasswordValidator should return invalid format', (){
    //arrange
    final String passw = "asd12345";
    //act
    final String result = PasswordValidator.validate(passw);
    //assert
    expect(result, PasswordValidator.passwordInvalidFormat);
  },);


  test('PasswordValidator should return invalid format', (){
    //arrange
    final String passw = "#@!12345";
    //act
    final String result = PasswordValidator.validate(passw);
    //assert
    expect(result, PasswordValidator.passwordInvalidFormat);
  },);


  test('PasswordValidator should return invalid format', (){
    //arrange
    final String passw = "#s!12345";
    //act
    final String result = PasswordValidator.validate(passw);
    //assert
    expect(result, PasswordValidator.passwordInvalidFormat);
  },);


  test('PasswordValidator should return cant be empty', (){
    //arrange
    final String passw = "";
    //act
    final String result = PasswordValidator.validate(passw);
    //assert
    expect(result, PasswordValidator.passwordCantBeEmpty);
  },);
}