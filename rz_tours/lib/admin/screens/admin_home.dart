// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:rz_tours/admin/screens/add_prdouct.dart';

class AdminHome extends StatelessWidget {
  static String id = 'AdminHome';

  get red => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: red,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: double.infinity, //width column = width screen
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, AddProduct.id);
              },
              child: Text('Add Trip'),
            ),
            RaisedButton(
              onPressed: () {},
              child: Text('Edit Trip'),
            ),
            RaisedButton(
              onPressed: () {},
              child: Text('View Trips'),
            ),
            RaisedButton(
              onPressed: () {},
              child: Text('Delete Trips'),
            )
          ],
        ));
  }
}
