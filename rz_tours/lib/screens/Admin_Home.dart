import 'package:flutter/material.dart';
import 'package:rz_tours/screens/homeMobile.dart';
import 'package:rz_tours/widgets/admin_Drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Admin_HomeScreen extends StatefulWidget {
  @override
  _Admin_HomeScreen createState() => _Admin_HomeScreen();
}

List cards = [
  {
    'icon': 59638,
    'value': 99,
    'color': [
      Colors.blue[100],
      Colors.blue[200],
      Colors.blue[300],
      Colors.blue[400],
      Colors.blue[500]
    ]
  },
  {
    'icon': 59130,
    'value': 25,
    'color': [
      Colors.purple[100],
      Colors.purple[200],
      Colors.purple[300],
      Colors.purple[400],
      Colors.purple[500]
    ]
  },
  {
    'icon': 57382,
    'value': 63,
    'color': [
      Colors.red[100],
      Colors.red[200],
      Colors.red[300],
      Colors.red[400],
      Colors.red[500]
    ]
  },
  {
    'icon': 60360,
    'value': 74,
    'color': [
      Colors.green[100],
      Colors.green[200],
      Colors.green[300],
      Colors.green[400],
      Colors.green[500]
    ]
  }
];

class _Admin_HomeScreen extends State<Admin_HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: HomeMobile(),
      //       watch: Container(color: Colors.purple)
    );
  }
}
