import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;

  final Function onClick;

  CustomTextField({required this.onClick, required this.hint});

  get validate => null;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        // validator: (String? value) {
        //   if (value == null || value.isEmpty) {
        //     return 'Unfilled field';
        //   }
        // },
        validator: (value) {
          return validate!(value);
        },
        onSaved: onClick(),
        obscureText: hint == 'Enter your password' ? true : false,
        cursorColor: Colors.yellow,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.white)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.white)),
        ),
      ),
    );
  }
}
