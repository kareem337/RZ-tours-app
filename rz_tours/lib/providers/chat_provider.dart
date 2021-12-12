import 'dart:html';

import 'package:flutter/material.dart';
import 'package:rz_tours/models/chat_model.dart';

class ChatsProvider extends ChangeNotifier {
  List<Chats> chats = <Chats>[];
  List<Chats> get getChats {
    return chats;
  }

  void SendMessage(int SenderId, int RecieverId, String Message) {
    Chats chat = new Chats(SenderId, RecieverId, Message);
    chats.add(chat);
    notifyListeners();
  }

  void DeleteMessage(int index) {
    chats.removeAt(index);
    notifyListeners();
  }
}
