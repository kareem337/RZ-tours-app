import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String tag = 'About us';

  @override
  Widget build(BuildContext context) {
    final About = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Welcome Alucard',
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    final Aboutus = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Rz tours is available in 43 languages and offers more than reported accommodation listings, including 100 homes, apartments, and other unique places to stay. Wherever you want to go and whatever you want to do, Rz tours makes it easy and supports you with 24/7 customer support. ',
        style: TextStyle(fontSize: 16.0, color: Colors.black),
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.lightBlueAccent,
        ]),
      ),
    );

    return Scaffold(
      body: body,
    );
  }
}
