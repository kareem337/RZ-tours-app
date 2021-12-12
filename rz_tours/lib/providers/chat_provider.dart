// import 'dart:html';

// import 'package:flutter/material.dart';
// import 'package:rz_tours/models/chat_model.dart';

// class ChatsProvider extends ChangeNotifier {
//   List<Chats> _chats = <Chats>[];
//   List<Chats> get getChats {
//     return _chats;
//   }

//   void SendMessage(int _SenderId, int _RecieverId, String _Message) {
//     Chats chat = new Chats(_SenderId, _RecieverId, _Message);
//     _chats.add(chat);
//     notifyListeners();
//   }

//   void DeleteMessage(int index) {
//     _chats.removeAt(index);
//     notifyListeners();
//   }
// }
