
import 'package:chat_app_front/auth/user_model.dart';
import 'package:chat_app_front/common/failure.dart';
import 'package:chat_app_front/auth/user.dart';
import 'package:chat_app_front/auth/user_repository.dart';
import 'package:chat_app_front/config.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class UserRepositoryImpl implements UserRepository{
  @override
  Future<String> signUpUser(User user) async {
    var url = SERVER_IP + '/post/user';
    UserModel userModel = user;
    var res = await http.post(url, body: userModel.toJson());
    if(res.statusCode == 200){
      return "";
    }
    //TODO: Handle other status codes
    return "Unkown behaviour";
  }

}