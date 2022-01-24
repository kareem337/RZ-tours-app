import 'package:flutter/material.dart';
import 'package:rz_tours/screens/Add_Product_page.dart';
import 'package:rz_tours/screens/Admin_Home.dart';
import 'package:rz_tours/screens/Mange_products.dart';
import 'package:rz_tours/screens/Orders.dart';
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
            title: Text('Dashboard'),
            onTap: () {
              Helper.nextScreen(context, Admin_HomeScreen());
              //Navigator.pushNamed(context, Add_product.id);
            },
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
            title: Text('Museums'),
            onTap: () {
              Helper.nextScreen(context, ManageProducts());
            },
          ),
          ListTile(
            leading: Icon(Icons.list_alt_sharp),
            title: Text('Orders'),
            onTap: () {
              Helper.nextScreen(context, Orders());
            },
          ),
          ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text(
                    'Log out',
                    style: TextStyle(fontSize: 20.0),
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
