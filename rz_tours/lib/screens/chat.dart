import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rz_tours/models/chat.dart';
import 'package:rz_tours/providers/chat_provider.dart';
import 'package:rz_tours/services/authentication.dart';

TextEditingController _chat = TextEditingController();

class Chat extends StatefulWidget {
  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  String? s;

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user?.uid;
    final Stream<QuerySnapshot> snapshot = FirebaseFirestore.instance
        .collection('chats')
        .where('sender_id', isEqualTo: uid)
        .snapshots();
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat "),
      ),
      body: Container(
        child: Align(
          alignment: Alignment.bottomLeft,
          child: ListView(
            children: [
              Consumer<ChatProvider>(
                builder: (context, ChatProvider data, child) {
                  print(data.getNotes);
                  return data.getNotes.length != 0
                      ? Container(
                          height: 150,
                          child: ListView.builder(
                            itemCount: data.getNotes.length,
                            itemBuilder: (context, index) {
                              print(data.getNotes[index].msg);
                              return MessageContainer(
                                  data.getNotes[index], index);
                            },
                          ),
                        )
                      : GestureDetector(
                          child: Center(
                              child: ElevatedButton(
                                  onPressed: () {
                                    print("object");
                                  },
                                  child: Text("doos"))),
                        );
                },
              ),
              Container(
                padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                height: 60,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextField(
                        controller: _chat,
                        decoration: InputDecoration(
                            hintText: "Write message...",
                            hintStyle: TextStyle(color: Colors.black54),
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        Provider.of<ChatProvider>(context, listen: false)
                            .sendMessage(_chat.text,
                                'KmZ2KfdcM2fEGJCvTBFty7XRK422', uid!);
                        Authentication().SendMessage(
                            mess: _chat.text.trim(),
                            recId: 'KmZ2KfdcM2fEGJCvTBFty7XRK422');
                        // FireStoreServices().SendMessage(
                        //     mess: _chat.text.trim(),
                        //     recId: 'KmZ2KfdcM2fEGJCvTBFty7XRK422');
                        //Navigator.of(context).pop();
                        print(_chat.text);
                      },
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 18,
                      ),
                      backgroundColor: Colors.amber,
                      elevation: 0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MessageContainer extends StatelessWidget {
  // const MessageContainer({Key? key}) : super(key: key);
  final ChatModel chat;
  final int index;
  MessageContainer(this.chat, this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
        child: Text(
          "${chat.msg}",
          style: TextStyle(color: Colors.white),
        ));
  }
}
