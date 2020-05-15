import 'dart:convert';

import 'package:chat_app_front/auth/response.dart';
import 'package:chat_app_front/auth/user.dart';
import 'package:http/http.dart' as http;

class UserFacadeImpl implements UserFacade {
  final String authURI;
  final String signUpPath = "/user/post";
  final String loginPath = "/login";

  UserFacadeImpl(this.authURI);

  @override
  Future<Response<AuthToken>> logIn(String username, String password) async {
    var logInEndpoint = authURI + loginPath;
    AuthToken token;
    ResponseStatus status;
    var res;
    try {
      res = await http.post(
        logInEndpoint,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({"name": username, "password": password}),
      );
    } catch (e) {
      status = ResponseStatus.CANT_CONNECT_TO_SERVER;
      return Response<AuthToken>(status, token);
    }
    if (res.statusCode == 200) {
      status = ResponseStatus.OK;
      final jwt = res.headers['Authorization'];
      token = AuthToken(jwt);
    } else if (res.statusCode == 403) {
      status = ResponseStatus.UNAUTHORIZED_ACCESS;
    } else if (res.statusCode == 422) {
      status = ResponseStatus.NULL_FIELD;
    } else {
      status = ResponseStatus.CANT_CONNECT_TO_SERVER;
    }
    return Response<AuthToken>(status, token);
  }

  @override
  Future<Response<void>> signUp(User user) async {
    var signUpEndpoint = authURI + signUpPath;
    var res;
    ResponseStatus status;
    try {
      res = await http.post(
        signUpEndpoint,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(user.toJson()),
      );
    } catch (e) {
      status = ResponseStatus.CANT_CONNECT_TO_SERVER;
      return Response<AuthToken>(status, null);
    }

    if (res.statusCode == 200) {
      status = ResponseStatus.OK;
    } else if (res.statusCode == 422) {
      //TODO: somehow retrieve information of what went wrong
      status = ResponseStatus.NULL_FIELD;
    } else if (res.statusCode == 400) {
      status = ResponseStatus.USER_EXISTS;
    } else {
      status = ResponseStatus.CANT_CONNECT_TO_SERVER;
    }
    return Response<void>(status, null);
  }
}
