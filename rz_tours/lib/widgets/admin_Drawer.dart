import 'package:flutter/material.dart';
import 'package:rz_tours/screens/Add_Product_page.dart';
import 'package:rz_tours/screens/Admin_Home.dart';
import 'package:rz_tours/screens/Mange_products.dart';
import 'package:rz_tours/screens/Trips_home.dart';
import 'package:rz_tours/screens/sign_in.dart';
import 'package:rz_tours/services/authentication.dart';
import 'package:rz_tours/utils/helper.dart';

class MobileDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Welcome Back, Admin',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.store),
            title: Text('Add Product'),
            onTap: () {
              Helper.nextScreen(context, Add_product());
              //Navigator.pushNamed(context, Add_product.id);
            },
          ),
          ListTile(
            leading: Icon(Icons.people_sharp),
            title: Text('Prducts'),
            onTap: () {
              Helper.nextScreen(context, ManageProducts());
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Admins'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.list_alt_sharp),
            title: Text('Orders'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              'Log out',
              style: TextStyle(fontSize: 24.0),
            ),
            onTap: () {
              Authentication().signuutt();
              Helper.nextScreen(context, SignIn());
              ;
            },
          ),
        ],
      ),
    );
  }
}
