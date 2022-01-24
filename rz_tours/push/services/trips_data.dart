import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rz_tours/models/Trips.dart';
import 'package:rz_tours/models/user_cart.dart';

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
      String tripID = doc.reference.id;
      _tripDataList.add(Trip(
          tid: tripID,
          Trip_name: data['name'],
          Trip_description: data['description'],
          Location: data['location'],
          Trip_price: data['price'],
          imagePath: data['image'],
          pl:data['picking place'],
          liked: false,
          Trip_Types: Trips.OUT_OF_CAIRO));
    }
    return _tripDataList;
  }

  bookOrder(UserCart order) async {
    DateTime currentDate = DateTime.now();
    CollectionReference order_details =
        FirebaseFirestore.instance.collection('Orders');
    var currentUser = FirebaseAuth.instance.currentUser;
    var uid = currentUser!.uid;
    order_details.add({
      'Order Name': order.name,
      'Total Price': order.price,
      'User Id': uid,
      'Date':order.dateTime,
      'Quantity':order.quantity,
      'Order placed Date': currentDate
      //"Item": FieldValue.arrayUnion(yourItemList),
    });

    return "Ordered Successfully";
  }
}
