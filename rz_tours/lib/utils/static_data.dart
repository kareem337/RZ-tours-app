
import 'package:rz_tours/models/Museum_tickets.dart';
import 'package:rz_tours/models/Trips.dart';

class StaticData {
  // ignore: non_constant_identifier_names
  static final List<Trip> SomeTrips = [
    Trip(
      Trip_name: "Museum 1",
      imagePath: "assets/Trip-1.png",
      Trip_price: 200,
      Trip_description: "Lunch Included",
      Location: "El tahrir ",
      Trip_Types: Trips.IN_CAIRO,
      liked: false,
    ),
    Trip(
      Trip_name: "Museum 2",
      imagePath: "assets/Trip-2.png",
      Trip_price: 300,
      Trip_description: "Lunch Included",
      Location: "El tahrir ",
      Trip_Types : Trips.OUT_OF_CAIRO,
      liked: true,
    ),
    Trip(
      Trip_name: "Museum 3",
      imagePath: "assets/Trip-3.png",
      Trip_price: 200,
      Trip_description: "Lunch Included",
      Location: "El tahrir ",
      Trip_Types: Trips.OUT_OF_CAIRO,
      liked: false,
    ),
    Trip(
     Trip_name: "Museum 4",
      imagePath: "assets/Trip-4.png",
      Trip_price: 100,
      Trip_description: "Lunch Included",
      Location: "El tahrir ",
      Trip_Types: Trips.IN_CAIRO,
      liked: true,
    ),
  ];

    static final List<Tickets> SomeTickets = [
Tickets(
  museum_name: "Ticket 1",
  imagePath: "assets/Trip-4.png",
    Ticket_price: "100 EG",
      museum_description: "Lunch Included",
      Location: "El tahrir ",
      Open_time:"9AM",
      liked: true,
   ),
   Tickets(
  museum_name: "Ticket 2",
  imagePath: "assets/Trip-4.png",
    Ticket_price: "100 EG",
      museum_description: "Lunch Included",
      Location: "El tahrir ",
      Open_time:"9AM",
      liked: true,
   ),
   Tickets(
  museum_name: "Ticket 3",
  imagePath: "assets/Trip-4.png",
    Ticket_price: "100 EG",
      museum_description: "Lunch Included",
      Location: "El tahrir ",
      Open_time:"9AM",
      liked: true,
   ),
   Tickets(
  museum_name: "Ticket 4",
  imagePath: "assets/Trip-4.png",
    Ticket_price: "100 EG",
      museum_description: "Lunch Included",
      Location: "El tahrir ",
      Open_time:"9AM",
      liked: true,
   ),
    
  ];
}

