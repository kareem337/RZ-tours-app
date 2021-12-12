import 'package:flutter/foundation.dart';
import 'package:rz_tours/models/cart_model.dart';

class CartProvider extends ChangeNotifier {
  List<Cart> carts = <Cart>[];
  List<Cart> get getCarts {
    return carts;
  }

  void AddCart(String image, String name, double price) {
    Cart c = new Cart(image, name, price);
    carts.add(c);
    notifyListeners();
  }

  void RemoveCart(int index) {
    carts.removeAt(index);
    notifyListeners();
  }
}
