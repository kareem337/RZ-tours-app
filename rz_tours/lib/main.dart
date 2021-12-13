import 'package:flutter/material.dart';
import 'package:rz_tours/screens/cart.dart';
import 'package:rz_tours/screens/chat.dart';
import 'package:rz_tours/screens/home.dart';
import 'package:rz_tours/screens/edit_profile.dart';
import 'package:rz_tours/screens/sign_in.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: Home(),
    );
  }
}
