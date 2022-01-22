import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rz_tours/models/Trips.dart';

class TripsData {
  List<Trip> trips = [];

  Stream<QuerySnapshot> loadTrips() {
    return FirebaseFirestore.instance.collection('Products').snapshots();
  }

  fetchdata() //async
  {
    // DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance.collection('my_contact').doc('details').get();
    //  CollectionReference documentSnapshot = FirebaseFirestore.instance.collection('Products');

    FirebaseFirestore.instance
        .collection("Products")
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        //print(result.data());

        trips.add(Trip(
            Trip_name: result['name'],
            Trip_description: result['Trip_description'],
            Location: result['Location'],
            Trip_price: result['Trip_price'],
            imagePath: result['imagePath'],
            liked: false,
            Trip_Types: Trips.OUT_OF_CAIRO,
            tripid: ''));
      });
      return trips;
    });

    // trips.add(Trip(
    // Trip_name: documentSnapshot['name'],
    // Trip_description: documentSnapshot['Trip_description'],
    // Location: documentSnapshot['Location'],
    // Trip_price: documentSnapshot['Trip_price'],
    // imagePath: documentSnapshot['imagePath'],
    // liked:false,
    // Trip_Types: Trips.OUT_OF_CAIRO
    // ));
  }

  fetchvideo() {}
}
