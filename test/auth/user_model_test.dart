
import 'dart:convert';

import 'package:chat_app_front/auth/user.dart';
import 'package:chat_app_front/auth/user_model.dart';
import 'package:flutter_test/flutter_test.dart';


import '../fixtures/fixture_reader.dart';


void main(){

  final user = UserModel(username:"test1", email:"test@test.com", password:"zaq1@WSX");


  group("from Json", (){
    test('should return a valid model when JSON are proper strings', () async{
      //arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('user_one.json'));
      //act
      final result = UserModel.fromJson(jsonMap);
      //assert
      expect(result, user);
    });
  });
}