import 'package:flutter/foundation.dart';
import 'package:rz_tours/models/chat.dart';

class ChatProvider extends ChangeNotifier
{
  List <ChatModel> _messages = <ChatModel>[];

  List<ChatModel> get getMsgs 
  {
    return _messages;
  }

  void sendMessage (String msg,String uid,String recId)
  {
    ChatModel message = new ChatModel(msg,recId,uid);
    _messages.add(message);
    notifyListeners();

  }
}

