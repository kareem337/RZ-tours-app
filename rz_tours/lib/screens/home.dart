import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.power), title: Text("RZ Tours"),
      ),
      body: ListView(
        children: [
          Row(
            children: [
              
            ],
          )
        ],
      ),
    );
  }
}
