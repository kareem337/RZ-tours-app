import 'package:flutter/cupertino.dart';
import 'package:rz_tours/models/Trips.dart';
import 'package:rz_tours/services/trips_data.dart';

class TripsProvider with ChangeNotifier {
  List<Trip> _tr = [];
  List<Trip> tin = [];
  get trip {
    return _tr;
  }

  fetchTrips() async {
<<<<<<< Updated upstream
    List<Trip> tt = await TripsData().fetchvideo();
=======
    List<Trip> tt = await TripsData().fetchMuseum();
>>>>>>> Stashed changes
    _tr = tt;
    notifyListeners();
  }

  get basketItems {
    return _tr;
  }

 
}
