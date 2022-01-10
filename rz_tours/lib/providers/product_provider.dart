import 'package:flutter/cupertino.dart';
import 'package:rz_tours/models/product_model.dart';
//admin side
class ProductProvider extends ChangeNotifier {
  List<Products> _products = <Products>[];
  List<Products> get getProducts {
    return _products;
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
}
