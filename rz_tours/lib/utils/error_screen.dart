import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('Error Screen'),
      ),
      body: Center(child: Text("Error, Please Try again Later...")),
    );
  }
}
