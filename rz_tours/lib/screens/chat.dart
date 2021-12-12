import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rz_tours/widgets/button_bar.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  String? s;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent[100],
        title: Row(
          children: [
            // ignore: prefer_const_constructors
            CircleAvatar(
              radius: 20,
              // ignore: prefer_const_constructors
              backgroundImage: NetworkImage(
                  "https://pyxis.nymag.com/v1/imgs/6ca/c27/d480ad69b8be1bff0dc381baefb2d41ac0-30-tim-cook.2x.h473.w710.jpg"),
            ),
            Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [Text("Name of The User"), Text("Active 1 min ago")],
            )
          ],
        ),
      ),
      bottomNavigationBar: Buttom(),
      body: Container(
        // ignore: prefer_const_constructors
        padding: EdgeInsets.all(20),
        // ignore: prefer_const_constructors
        margin: EdgeInsets.all(20),
        child: ListView(
          children: [
            Container(
              color: Colors.amberAccent[100],
              width: 100,
              height: 100,
            ),
            Container(
              child: Text('$s'),
              color: Colors.blue,
              width: 100,
              height: 100,
            ),
            TextField(
              onChanged: (val) {
                s = val;
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: ' Send a message'),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // ignore: prefer_const_constructors
                Text("Hello"),
                // ignore: prefer_const_constructors
                IconButton(
                    onPressed: () {
                      setState(() {});
                    },
                    icon: Icon(Icons.send))
              ],
            )
          ],
        ),
      ),
    );
  }
}
