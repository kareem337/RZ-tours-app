import 'package:flutter/foundation.dart';
import 'package:rz_tours/models/cart_model.dart';

class CartProvider extends ChangeNotifier {
  List<Cart> _carts = <Cart>[];
  List<Cart> get getCarts {
    return _carts;
  }

  void AddCart(String _image, String _name, double _price) {
    Cart c = new Cart(_image, _name, _price);
    _carts.add(c);
    notifyListeners();
  }

  void RemoveCart(int index) {
    _carts.removeAt(index);
    notifyListeners();
  }
}
