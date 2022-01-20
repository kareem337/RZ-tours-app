
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rz_tours/models/Trips.dart';
import 'package:rz_tours/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Store {
  final FirebaseFirestore _firestore =FirebaseFirestore.instance;

  addTrip(Trip product) {
   
    _firestore.collection(Trips_table).add({
      museum_name: product.museum_name,
      Trip_description: product.Trip_description,
      Location: product.Location,
      Trip_price: product.Trip_price,
      imagePath: product.imagePath
    });
  }
   Stream<QuerySnapshot>loadTrips(){
     return _firestore.collection(Trips_table).snapshots();
  // List<Trip> trips=[];
  //   await for (var snapshot in _firestore.collection(Trips_table).snapshots()){
  
  //   for(var doc in snapshot.docs)
  //   {
  //     var data =doc.data();
  //     trips.add(Trip(
  //     museum_name: data[museum_name],
  //     Trip_description: data[Trip_description],
  //     Location: data[Location],
  //     Trip_price: data[Trip_price],
  //     imagePath: data[imagePath],
  //     liked:false, 
  //     Trip_Types: Trips.OUT_OF_CAIRO
  //     ),
  //     );
      
      
  //   }
    
  //   }
  //   return trips;
  // }
}
Stream<QuerySnapshot> loadOrders() {
    return _firestore.collection(Trips_orders).snapshots();
  }
  deleteProduct(trip_Id) {
    _firestore.collection(Trips_table).doc(trip_Id).delete();
  }
}