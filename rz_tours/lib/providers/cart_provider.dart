import 'package:flutter/material.dart';
import 'package:rz_tours/models/user_cart.dart';
import 'package:rz_tours/services/trips_data.dart';

<<<<<<< Updated upstream
class Cart extends ChangeNotifier{
  List<UserCart> _items = [];

=======
class Cart extends ChangeNotifier {
  List<UserCart> _items = [];
>>>>>>> Stashed changes
  List<String> names=[];
  int _totalPrice = 0;

  void addNames(UserCart item) {
    names.add(item.name);
    notifyListeners();
  }


  void add(UserCart item) {
    _items.add(item);
    _totalPrice += item.price*item.quantity;
    notifyListeners();
  }

  void remove(UserCart item) {
    _totalPrice -= item.price*item.quantity;
    _items.remove(item);
    notifyListeners();
  }

    void removeAll() {
    _totalPrice = 0;
    _items.clear();
    notifyListeners();
  }

  int get count {
    return _items.length;
  }

  int get totalPrice {
    return _totalPrice;
  }

  List<UserCart> get basketItems {
    return _items;
  }

<<<<<<< Updated upstream
  bookOrder (UserCart order) async
  {
    await TripsData().bookOrder(order);
=======
  bookOrder (UserCart order)
  {
    TripsData().bookOrder(order);
>>>>>>> Stashed changes
    notifyListeners();
  }
}