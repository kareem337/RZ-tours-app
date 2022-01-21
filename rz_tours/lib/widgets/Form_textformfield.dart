import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Form_field extends StatelessWidget {
  late String hint;
  late Function onClick;

  Form_field({required this.onClick, required this.hint});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Unfilled field';
                }
              },
              onSaved: onClick(),
              decoration: InputDecoration(
                  hintText: hint,
                  labelStyle: TextStyle(fontSize: 24, color: Colors.black),
                  border: InputBorder.none,
                  fillColor: Colors.black12,
                  filled: true),
              obscureText: false,
              maxLength: 20,
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
