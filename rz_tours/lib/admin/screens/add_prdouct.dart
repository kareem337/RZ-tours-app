// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:rz_tours/widgets/product.dart';

abstract class AddProduct extends StatefulWidget {
  static String id = 'Add Product';
  late String _name, _price, _description, _category;

  get value => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Product Name',
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Product Price',
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Prdouct Description',
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Product Location',
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Product Category',
          ),
        ),
      ],
    ));
  }
}