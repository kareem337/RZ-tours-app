import 'package:flutter/material.dart';

class editfrom extends StatelessWidget {
  const editfrom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ));
  }

  buildTextField(
    TextEditingController controller,
    String labelText,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      // color: Colors.blue, border: Border.all(color: Colors.blue)),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            // hintText: hint,
            // hintStyle: TextStyle(
            // fontSize: 18, fontWeight: FontWeight.bold), //hint text style
            // hintMaxLines: 2, //hint text maximum lines
            // hintTextDirection: TextDirection.rtl,
            //labelStyle: TextStyle(color: Colors.white),
            labelStyle: TextStyle(fontSize: 24, color: Colors.black),
            border: InputBorder.none,
            fillColor: Colors.black12,
            filled: true
            // prefix: Icon(icon),
            ),
        obscureText: false,
        maxLength: 200,
      ),
    );
  }
}
