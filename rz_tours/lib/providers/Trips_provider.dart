import 'package:flutter/cupertino.dart';
import 'package:rz_tours/models/Trips.dart';
import 'package:rz_tours/services/trips_data.dart';

class TripsProvider with ChangeNotifier {
  List<Trip> _tr = [];
  get trip {
    return _tr;
  }

  fetchTrips() {
    var tt = TripsData().fetchvideo();
    _tr = tt;
    notifyListeners();
  }

  get basketItems {
    return _tr;
  }
}
