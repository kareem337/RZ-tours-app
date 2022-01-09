import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Adminmode extends ChangeNotifier {
  bool inadmin = false;
  Changeinadmin(bool value) {
    inadmin = value;
    notifyListeners();
  }
}
