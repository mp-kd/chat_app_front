import 'package:chat_app_front/global_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MessageFrame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MessageFrameModel>(
      builder: (context, value, child) {
        TextStyle _style;
        MessageType messageType =
            Provider.of<MessageFrameModel>(context).messageType;
        if (messageType == MessageType.SUCCESS) {
          _style = TextStyle(
            color: Theme.of(context).primaryColor,
          );
        } else if (messageType == MessageType.FAILURE) {
          _style = TextStyle(
            color: Theme.of(context).accentColor,
          );
        }
        return Text(
          GlobalLocalizations.of(context)
              .translate(Provider.of<MessageFrameModel>(context).messageKey),
          style: _style,
        );
      },
    );
  }
}

enum MessageType { SUCCESS, FAILURE }

class MessageFrameModel with ChangeNotifier {
  MessageType messageType = MessageType.SUCCESS;
  String messageKey = "";

  MessageType get getMessageType => messageType;

  String get getContent => messageKey;

  void changeMessageFrame(MessageType messageType, String content) {
    this.messageType = messageType;
    this.messageKey = content;

    notifyListeners();
  }
}
