import 'dart:convert';

import 'package:chat_app_front/auth/user.dart';
import 'package:chat_app_front/auth/user_service.dart';
import 'package:chat_app_front/config.dart';
import 'package:http/http.dart' as http;

class UserServiceImpl implements UserService {
  @override
  Future<UserServiceResponse> signUpUser(User user) async {
    var url = SERVER_URL + '/user/post';

    var res = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(user.toJson()),
    );

    if (res.statusCode == 200) {
      return UserServiceResponse.SUCCESS;
    }

    //TODO: Handle other status codes
    return UserServiceResponse.UNKNOWN_REASON;
  }

  @override
  Future<UserServiceResponse> loginUser(User user) async {
    var url = SERVER_URL + '/login';

    var res = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(user.toJson()),
    );
    //TODO: retrieve jwt and store it
    if (res.statusCode == 200) {
      //storage.write(key: 'jwt', value: "test");
      return UserServiceResponse.SUCCESS;
    }

    //TODO: Handle other status codes
    return UserServiceResponse.UNKNOWN_REASON;
  }
}
