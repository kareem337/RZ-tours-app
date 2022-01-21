import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rz_tours/models/Trips.dart';

class TripsData {
  List<Trip> _tripDataList = [];

  Stream<QuerySnapshot> loadTrips() {
    return FirebaseFirestore.instance.collection('Products').snapshots();
  }

  fetchvideo() async {
    var snapshot =
        await FirebaseFirestore.instance.collection("Products").get();

    for (var doc in snapshot.docs) {
      var data = doc.data();
      _tripDataList.add(Trip(
          Trip_name: data['name'],
          Trip_description: data['description'],
          Location: data['location'],
          Trip_price: data['price'],
          imagePath: data['image'],
          liked: false,
          Trip_Types: Trips.OUT_OF_CAIRO));
    }
    return _tripDataList;
  }
}
