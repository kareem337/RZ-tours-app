import 'package:flutter/material.dart';

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
      ),
    );
  }
}
