import 'package:flutter/material.dart';
import 'package:rz_tours/screens/home.dart';
import 'package:rz_tours/screens/edit_profile.dart';

import 'screens/sign_in.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '\home',
      routes: {
        "\home": (context) => Home(),
        "\login": (context) => SignIn(),
      
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: Home(),
    );
  }
}
