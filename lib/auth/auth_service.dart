import 'package:chat_app_front/config.dart';
import 'package:http/http.dart' as http;
import 'user.dart';

class AuthService{
  static Future<int> attemptSignUp(User newUser) async{
    var res = await http.post(
        '$SERVER_IP/user/post',
        headers: <String, String>{
          "Content-type" : "application/json"
        },
        body: newUser.toJson()
    );
    return res.statusCode;
  }

  static Future<String> attemptLogIn(User user) async{
    var res = await http.post(
        "$SERVER_IP/login",
        headers: <String, String>{
          "Content-Type" : "application/json"
        },
        body: user.toJson()
    );
    if(res.statusCode == 200) return res.body;

    return null;
  }
}