import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rz_tours/models/person_model.dart';
import 'package:rz_tours/screens/home.dart';
import 'package:rz_tours/utils/helper.dart';

class Authentication {
  Future<String?> Signin(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      var currentUser = FirebaseAuth.instance.currentUser;
      var uid = currentUser!.uid;
      if (currentUser != null && !currentUser.emailVerified) {
        await currentUser.sendEmailVerification();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<Object?> Signup(
      String first, String last, String email, String pass) async {
    try {
      CollectionReference user_details =
          FirebaseFirestore.instance.collection('User_Details');
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pass);
      var currentUser = FirebaseAuth.instance.currentUser;
      var uid = currentUser!.uid;

      FirebaseFirestore.instance.collection('User_Details').doc(uid).set({
        'First_Name': first,
        'Last_Name': last,
        'User_Id': uid,
        'User_Type': 1
      });
      // userData.add(Person(_firstName:fn, _lastName:ln, _email:email, _password:password ,_id:uid));
      return "Signed In Successfully";
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak") {
        print(e.message);
        return e.message;
      } else if (e.code == "email-already-in-use") {
        print(e.message);
        return e.message;
      } else {
        print(e.message);
        return e.message;
      }
    }
  }

  Future<Object> SendMessage(
      {required String mess, required String recId}) async {
    try {
      CollectionReference chats =
          await FirebaseFirestore.instance.collection('chats');
      var currentUser = FirebaseAuth.instance.currentUser;
      var uid = currentUser!.uid;
      chats.add({'message': mess, 'reciever_id': recId, 'sender_id': uid});
      return "Message Sent Successfully";
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  late FirebaseAuth _firebaseAuth;

  Future<void> signuutt() async {
    await _firebaseAuth.signOut();
  }
}
