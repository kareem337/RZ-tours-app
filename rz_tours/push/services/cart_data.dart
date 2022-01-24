import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rz_tours/models/Trips.dart';
import 'package:rz_tours/providers/Trips_provider.dart';

class cartData {
  var t = TripsProvider();
  Stream<QuerySnapshot> loadTrips() {
    return FirebaseFirestore.instance.collection('Products').snapshots();
  }

  // fetchdata() {
  //   FirebaseFirestore.instance
  //       .collection("Products")
  //       .get()
  //       .then((querySnapshot) {
  //     querySnapshot.docs.forEach((result) {
  //       t.addTrips(Trip(
  //           Trip_name: result['name'],
  //           Trip_description: result['Trip_description'],
  //           Location: result['Location'],
  //           Trip_price: result['Trip_price'],
  //           imagePath: result['imagePath'],
  //           liked: false,
  //           Trip_Types: Trips.OUT_OF_CAIRO));
  //     });
  //   });
  // }
}
