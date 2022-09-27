import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rz_tours/providers/cart_provider.dart';
import 'package:rz_tours/screens/cart_.dart';
import 'package:rz_tours/screens/product_view.dart';
import 'package:rz_tours/utils/helper.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget {
  String _title;

  CustomAppBar([this._title = '']);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        title: Text(
          this._title,
        ),
        backgroundColor: Colors.amber,
        elevation: 0.0,
        centerTitle: true,
        actions: <Widget>[
    IconButton(
      icon: Icon(
        Icons.shopping_cart,
        color: Colors.white,
      ),
      onPressed: () {
        Helper.nextScreen(context, CartView());
      },
    )
  ],
      ),
    );
  }
}
