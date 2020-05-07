
import 'dart:convert';
import 'package:chat_app_front/auth/user.dart';
import 'package:flutter_test/flutter_test.dart';


import '../fixtures/fixture_reader.dart';


void main(){

  final user = User(name:"test1", email:"test@test.com", password:"zaq1@WSX");


  group("from Json", (){
    test('should return a valid model when JSON are proper strings', () async{
      //arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('user_one.json'));
      //act
      final result = User.fromJson(jsonMap);
      //assert
      expect(result, user);
    });
  });

  group('to Json', (){
    test('should return a JSON of model', () async {
      //arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('user_one.json'));
      //act
      final result = user.toJson();
      //assert
      expect(result, jsonMap);
    });
  });
}