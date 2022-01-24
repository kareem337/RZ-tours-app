import 'package:flutter/material.dart';
import 'package:rz_tours/models/product_model.dart';

class CartModel extends ChangeNotifier {
  List<Products> _items = [];
  double _totalPrice = 0.0;




  void add(Products item) {
    _items.add(item);
    _totalPrice += item.price;
    notifyListeners();
  }

  void remove(Products item) {
    _totalPrice -= item.price;
    _items.remove(item);
    notifyListeners();
  }

  int get count {
    return _items.length;
  }

  double get totalPrice {
    return _totalPrice;
  }

  List<Products> get basketItems {
    return _items;
  }
}