import 'package:flutter/foundation.dart';
import 'package:rz_tours/models/chat_model.dart';

class ChatProvider extends ChangeNotifier
{
  List <Chat> _messages = <Chat>[];

  List<Chat> get getNotes 
  {
    return _messages;
  }

  void sendMessage (String msg)
  {
    Chat message = new Chat(msg);
    _messages.add(message);
    notifyListeners();

  }
}
