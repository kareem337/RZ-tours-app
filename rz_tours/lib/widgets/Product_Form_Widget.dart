import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rz_tours/models/Trips.dart';
import 'package:rz_tours/utils/Auth.dart';
import 'package:rz_tours/utils/Store.dart';
import 'package:rz_tours/widgets/Custom_textfield.dart';
import 'package:rz_tours/widgets/Form_textformfield.dart';

class Form_page extends StatefulWidget {
  //const Form_page({ Key? key}) : super(key: key);
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<Form_page> {
  static String id = "Addprouct";
  //final _auth = Auth();
  final formKey = GlobalKey<FormState>();
  final _store = Store();
  final controller = TextEditingController();
  String category = 'Category1';

  @override
  Widget build(BuildContext context) {
    String _Museum_Name = "",
        _Trip_description = "",
        _Location = "",
        _Image = "";
    int _Trip_price = 0;
    bool _Trip_type = false;
    String _imageUrl;
    File? _imageFile;
    return Form(
      key: formKey,
      child: Column(children: [
        // SizedBox(height: 10),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Unfilled field';
            }
          },
          onSaved: (value) {
            _Museum_Name = value!;
          },
          decoration: InputDecoration(
              hintText: "Museum Name",
              labelStyle: TextStyle(fontSize: 24, color: Colors.black),
              border: InputBorder.none,
              fillColor: Colors.black12,
              filled: true),
          obscureText: false,
          maxLength: 20,
        ),
        //SizedBox(height: 10.0),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Unfilled field';
            }
          },
          onSaved: (value) {
            _Trip_description = value!;
          },
          decoration: InputDecoration(
              hintText: "Trip description",
              labelStyle: TextStyle(fontSize: 24, color: Colors.black),
              border: InputBorder.none,
              fillColor: Colors.black12,
              filled: true),
          obscureText: false,
          maxLength: 20,
        ),

        //SizedBox(height: 10),
        // TextFormField(
        //   validator: (value) {
        //     if (value == null || value.isEmpty) {
        //       return 'Unfilled field';
        //     }
        //   },
        //   onSaved: (value) {
        //     _Trip_price = value! as int;
        //   },
        //   decoration: InputDecoration(
        //       hintText: "Trip price",
        //       labelStyle: TextStyle(fontSize: 24, color: Colors.black),
        //       border: InputBorder.none,
        //       fillColor: Colors.black12,
        //       filled: true),
        //   obscureText: false,
        //   maxLength: 20,
        // ),
        Image.file(
          _imageFile!,
          fit: BoxFit.cover,
          height: 250,
        ),
        ElevatedButton(
            //padding: EdgeInsets.all(16),
            //color: Colors.black54,
            child: Text(
              'Chose image Image',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w400),
            ),
            onPressed: () {}),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Unfilled field';
            }
          },
          onSaved: (value) {
            _Image = value!;
          },
          decoration: InputDecoration(
              hintText: "Image",
              labelStyle: TextStyle(fontSize: 24, color: Colors.black),
              border: InputBorder.none,
              fillColor: Colors.black12,
              filled: true),
          obscureText: false,
          maxLength: 20,
        ),
        // TextFormField(
        //   validator: (value) {
        //     if (value == null || value.isEmpty) {
        //       return 'Unfilled field';
        //     }
        //   },
        //   onSaved: (value) {
        //     _Trip_type = value! as bool;
        //   },
        //   decoration: InputDecoration(
        //       hintText: "Trip type",
        //       labelStyle: TextStyle(fontSize: 24, color: Colors.black),
        //       border: InputBorder.none,
        //       fillColor: Colors.black12,
        //       filled: true),
        //   obscureText: false,
        //   maxLength: 20,
        // ),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Unfilled field';
            }
          },
          onSaved: (value) {
            _Location = value!;
          },
          decoration: InputDecoration(
              hintText: "Location",
              labelStyle: TextStyle(fontSize: 24, color: Colors.black),
              border: InputBorder.none,
              fillColor: Colors.black12,
              filled: true),
          obscureText: false,
          maxLength: 20,
        ),

        ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.reset();
              }
            },
            child: Text("reset")),
        ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                _store.addTrip(Trip(
                  Trip_name: _Museum_Name,
                  imagePath: _Image,
                  liked: false,
                  Location: _Location,
                  Trip_description: _Trip_description,
                  Trip_price: 5,
                  Trip_Types: Trips.NA,
                  tripid: '',
                ));
              }
            },
            child: Text("Submit"))
      ]),
    );
  }
}
