import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
class Auth {
bool _initialized =false;


// ignore: sdk_version_constructor_tearoffs
//final _auth =FirebaseAuth.instanceFor;
final Firebase_in = Firebase.initializeApp;
final FirebaseAuth _firebaseAuth =FirebaseAuth.instance;
void Initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}
Future<dynamic>signup(String email,String Password) async
{ 
final authresult= (await _firebaseAuth.createUserWithEmailAndPassword(email: email
, password: Password));
return authresult;
}
Future<dynamic>signin(String email,String Password) async
{ 
final authresult= (await _firebaseAuth.createUserWithEmailAndPassword(email: email
, password: Password));
return authresult;
}

  Future<User> getUser() async {
    return await _firebaseAuth.currentUser!;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

}