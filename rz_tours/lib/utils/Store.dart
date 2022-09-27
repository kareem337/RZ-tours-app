import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rz_tours/models/Trips.dart';
import 'package:rz_tours/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart';

class Store {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? imageURL;

  addTrip(Trip product) {
<<<<<<< Updated upstream
    print(product.imagePath);
    _firestore.collection(museum).add({
=======
    _firestore.collection(Muesums_table).add({
>>>>>>> Stashed changes
      museum_name: product.Trip_name,
      Trip_description: product.Trip_description,
      Location: product.Location,
      Trip_price: product.Trip_price,
      imagePath: product.imagePath,
      pl: product.pl
    });
  }

  Stream<QuerySnapshot> loadorders() {
    return _firestore.collection("Orders").snapshots();
  }
  Stream<QuerySnapshot> loadTrips() {
<<<<<<< Updated upstream
    return _firestore.collection(museum).snapshots();
=======
    return _firestore.collection(Muesums_table).snapshots();
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
>>>>>>> Stashed changes
  }

  fecthdata() async {
    List<Trip> trips = [];
<<<<<<< Updated upstream
    await for (var snapshot
        in _firestore.collection(museum).snapshots()) {
=======
    await for (var snapshot in _firestore.collection(Muesums_table).snapshots()) {
>>>>>>> Stashed changes
      for (var doc in snapshot.docs) {
        var data = doc.data();
        trips.add(
          Trip(
              tid: data[tid],
              Trip_name: data[museum_name],
              Trip_description: data[Trip_description],
              Location: data[Location],
              Trip_price: data[Trip_price],
              imagePath: data[imagePath],
              pl: data[pl],
              liked: false,
              Trip_Types: Trips.OUT_OF_CAIRO,
<<<<<<< Updated upstream
              tid: '',
              pl: data[pl]),
=======
             ),
>>>>>>> Stashed changes
        );
      }
      return trips;
    }
  }

  deleteProduct(trip_Id) {
    _firestore.collection(museum).doc(trip_Id).delete();
  }

<<<<<<< Updated upstream
  editProduct(data, tripId) {
    _firestore.collection(museum).doc(tripId).update(data);
  }

  setimage(image_url) {
    print("hi $image_url");
    return imageURL = image_url;
  }

  getimageurl() {
    return imageURL;
  }

  Storeimage(imageurl) {
    _firestore.collection("image").add({"url": imageurl});
  }

  Future getImage() async {
    late String url;
    final _picker = ImagePicker();
    File? _image;
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    _image = File(pickedFile!.path);
    print('Image Path $_image');
    final name = basename(pickedFile.path);
    print(name);
    Reference storageReference =
        FirebaseStorage.instance.ref().child("Products Images/$name");
    final UploadTask uploadTask =
        storageReference.putFile(File(pickedFile.path));
    final TaskSnapshot downloadUrl = (await uploadTask);
    url = await downloadUrl.ref.getDownloadURL();
    return url;
=======
  deleteProduct(trip_Id) {
    _firestore.collection(Muesums_table).doc(trip_Id).delete();
>>>>>>> Stashed changes
  }
}
