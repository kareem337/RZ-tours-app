import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:rz_tours/models/Trips.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //String uid = FirebaseAuth.instance.currentUser!.uid;
  CollectionReference trip = FirebaseFirestore.instance.collection('Products');
  late DocumentSnapshot documentSnapshot;
// fetchdata()
// {
//   (documentSnapshot.data() as dynamic)['name'];

  
// }

  // Stream<List<Trip>> get books {
  //   return _firestore.collection("Products").snapshots().map((event) => event.docs
  //   .map((DocumentSnapshot documentSnapshot) => Trip( Trip_name: (documentSnapshot.data() as dynamic)["name"], Trip_description: (documentSnapshot.data() as dynamic)["description"],Location: (documentSnapshot.data() as dynamic)["location"],Trip_price: (documentSnapshot.data() as dynamic)["price"]))
  //       .toList());
  // }
}