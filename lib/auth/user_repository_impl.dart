import 'dart:convert';
import 'package:chat_app_front/auth/user.dart';
import 'package:chat_app_front/auth/user_repository.dart';
import 'package:chat_app_front/config.dart';
import 'package:http/http.dart' as http;

class UserRepositoryImpl implements UserRepository {
  @override
  Future<String> signUpUser(User user) async {
    var url = SERVER_IP + '/user/post';

    var res = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(user.toJson()),
    );

    if (res.statusCode == 200) {
      return "";
    }

    //TODO: Handle other status codes
    return "Unknown behaviour";
  }
}
