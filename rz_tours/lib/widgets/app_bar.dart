 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({Key? key}) : preferredSize = Size.fromHeight(60.0), super(key: key);

  @override
  final Size preferredSize;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar>{

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('RZ tours'),
 
    );
  }
}