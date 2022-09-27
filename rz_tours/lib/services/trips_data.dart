import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
<<<<<<< Updated upstream
import 'package:firebase_storage/firebase_storage.dart';
=======
>>>>>>> Stashed changes
import 'package:rz_tours/models/Trips.dart';
import 'package:rz_tours/models/user_cart.dart';
import 'package:rz_tours/utils/constants.dart';

class TripsData {
  List<Trip> _tripDataList = [];

  Stream<QuerySnapshot> loadTrips() {
<<<<<<< Updated upstream
    return FirebaseFirestore.instance.collection(museum).snapshots();
  }

  fetchvideo() async {
    var snapshot =
        await FirebaseFirestore.instance.collection(museum).get();
=======
    return FirebaseFirestore.instance.collection(Muesums_table).snapshots();
  }

  fetchMuseum() async {
    var snapshot =
        await FirebaseFirestore.instance.collection(Muesums_table).get();
>>>>>>> Stashed changes

    for (var doc in snapshot.docs) {
      var data = doc.data();
      String tripID = doc.reference.id;
      _tripDataList.add(Trip(
          tid: tripID,
          Trip_name: data[museum_name],
          Trip_description: data[Trip_description],
          Location: data[Location],
          Trip_price: data[Trip_price],
          imagePath: data[imagePath],
          pl:data[pl],
          liked: false,
          Trip_Types: Trips.OUT_OF_CAIRO));
    }
    return _tripDataList;
  }

  bookOrder(UserCart order) async {
    DateTime currentDate = DateTime.now();
    CollectionReference order_details =
<<<<<<< Updated upstream
        FirebaseFirestore.instance.collection(Orders_table);
    var currentUser = FirebaseAuth.instance.currentUser;
    var uid = currentUser!.uid;
var user_name = await FirebaseFirestore.instance.collection("User_Details").doc(uid).get().then((DocumentSnapshot ds){
  return ds['First_Name'];
});
final result = await order_details.doc(uid).get();
var current_user= result.data();
=======
        FirebaseFirestore.instance.collection('Orders');
    var currentUser = FirebaseAuth.instance.currentUser;
    var uid = currentUser!.uid;
>>>>>>> Stashed changes
    order_details.add({
      Order_name: order.name,
      Total_price: order.price,
      User_ID: uid,
      Date:order.dateTime,
      Quantity:order.quantity,
<<<<<<< Updated upstream
      Ordered_placed_date: currentDate,
      User_name:user_name,
     // imagePath:order.image
=======
      Ordered_placed_date: currentDate
>>>>>>> Stashed changes
    });

    return "Ordered Successfully";
  }
}
