import 'package:flutter/cupertino.dart';
import 'package:rz_tours/models/product_model.dart';
import 'package:rz_tours/models/Trips.dart';
import 'package:rz_tours/models/Museum_tickets.dart';
import 'package:rz_tours/utils/static_data.dart';

class ProductProvider extends ChangeNotifier {
  List<Products> _products = <Products>[];
  List<Products> get getProducts {
    return _products;
  }
  List<Trips>_Trips =<Trips>[];
  List<Trips> get getTrips {
    return _Trips;
  }
  List<Tickets>_Tickets =<Tickets>[];
  List<Tickets> get getTickets {
    return _Tickets;
  }

  void AddProduct(String _name, String _description, int _price,
      String _ProductImage, String _date, int _quantity) {
    Products p = new Products(
        _name, _description, _price, _ProductImage, _date, _quantity);
    _products.add(p);
    notifyListeners();
  }

  void RemoveProduct(int index) {
    _products.removeAt(index);
    notifyListeners();
  }

  void View_tickets()
  {
  
 notifyListeners();
  }
    void View_trips()
  {
  
 notifyListeners();
  }
}
