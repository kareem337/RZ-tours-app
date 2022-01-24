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
    print(product.imagePath);
    _firestore.collection(museum).add({
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
    return _firestore.collection(museum).snapshots();
  }

  fecthdata() async {
    List<Trip> trips = [];
    await for (var snapshot
        in _firestore.collection(museum).snapshots()) {
      for (var doc in snapshot.docs) {
        var data = doc.data();
        trips.add(
          Trip(
              Trip_name: data[museum_name],
              Trip_description: data[Trip_description],
              Location: data[Location],
              Trip_price: data[Trip_price],
              imagePath: data[imagePath],
              liked: false,
              Trip_Types: Trips.OUT_OF_CAIRO,
              tid: '',
              pl: data[pl]),
        );
      }
      return trips;
    }
  }

  deleteProduct(trip_Id) {
    _firestore.collection(museum).doc(trip_Id).delete();
  }

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
  }
}
