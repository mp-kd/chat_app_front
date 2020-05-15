import 'package:chat_app_front/auth/auth_label_keys.dart';
import 'package:chat_app_front/auth/response.dart';
import 'package:chat_app_front/auth/user.dart';
import 'package:chat_app_front/auth/widgets/message_frame.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class UserService {
  Future<void> logIn(String username, String password, BuildContext context);

  Future<void> signUp(User user, BuildContext context);
}

class UserServiceImpl implements UserService {
  UserFacade userFacade;

  UserServiceImpl(this.userFacade);

  static Map<ResponseStatus, String> messageKeys = {
    ResponseStatus.OK: AuthLabelKeys.userCreated,
    ResponseStatus.USER_EXISTS: AuthLabelKeys.userExists,
    ResponseStatus.CANT_CONNECT_TO_SERVER: AuthLabelKeys.cantConnectToServer,
    ResponseStatus.NULL_FIELD: AuthLabelKeys.invalidFieldData,
    ResponseStatus.UNAUTHORIZED_ACCESS: AuthLabelKeys.invalidCredentials,
  };

  @override
  Future<void> logIn(
      String username, String password, BuildContext context) async {
    var response = await userFacade.logIn(username, password);
    if (response.status == ResponseStatus.OK) {
      Navigator.of(context).popAndPushNamed('/dashboard');
    } else {
      Provider.of<MessageFrameModel>(context, listen: false).changeMessageFrame(
          MessageType.FAILURE, messageKeys[response.status]);
    }
  }

  @override
  Future<void> signUp(User user, BuildContext context) async {
    var response = await userFacade.signUp(user);
    if (response.status == ResponseStatus.OK) {
      Provider.of<MessageFrameModel>(context, listen: false).changeMessageFrame(
          MessageType.SUCCESS, messageKeys[response.status]);
    } else {
      Provider.of<MessageFrameModel>(context, listen: false).changeMessageFrame(
          MessageType.FAILURE, messageKeys[response.status]);
    }
  }
}
