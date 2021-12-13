import 'package:flutter/material.dart';
import 'package:flutter_application_products_page/models/Trips.dart';

class StaticData {
  // ignore: non_constant_identifier_names
  static final List<Trip> SomeTrips = [
    Trip(
      museum_name: "Museum 1",
      imagePath: "assets/images/Trip-1.png",
      Trip_price: "200 EG",
      Trip_description: "Lunch Included",
      Location: "El tahrir ",
      Trip_Types: Trips.IN_CAIRO,
      liked: false,
    ),
    Trip(
      museum_name: "Museum 2",
      imagePath: "assets/images/Trip-2.png",
      Trip_price: "300 EG",
      Trip_description: "Lunch Included",
      Location: "El tahrir ",
      Trip_Types : Trips.OUT_OF_CAIRO,
      liked: true,
    ),
    Trip(
      museum_name: "Museum 3",
      imagePath: "assets/images/Trip-3.png",
      Trip_price: "200 EG",
      Trip_description: "Lunch Included",
      Location: "El tahrir ",
      Trip_Types: Trips.OUT_OF_CAIRO,
      liked: false,
    ),
    Trip(
     museum_name: "Museum 4",
      imagePath: "assets/images/Trip-4.png",
      Trip_price: "100 EG",
      Trip_description: "Lunch Included",
      Location: "El tahrir ",
      Trip_Types: Trips.IN_CAIRO,
      liked: true,
    ),
  ];
}

class AGENCY {
}
