
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'Form_textformfield.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final Function onClick;
  CustomTextField(
      { required this.hint,required this.onClick});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextFormField(
            onSaved: onClick(),
            obscureText: hint == 'Enter your password' ? true : false,
            cursorColor: Colors.yellow,
            decoration: InputDecoration(
              hintText: hint,
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
            validator: (String? value) {
                        if (value == null || value.isEmpty ) {
                          return 'Unfilled field';
                        }
                      },
                      
          ),

        ),
      ],
    );
    
}
}