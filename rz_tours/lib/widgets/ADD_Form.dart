import 'package:flutter/material.dart';
import 'package:rz_tours/models/Trips.dart';
import 'package:rz_tours/screens/Mange_products.dart';
import 'package:rz_tours/utils/Auth.dart';
import 'package:rz_tours/utils/Store.dart';
import 'package:rz_tours/utils/helper.dart';

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
    String URL_result = "";
    String dropdownValue = 'One';
    String picking_place='';
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
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
              ),
              SizedBox(height: 10.0),
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
              ),
              SizedBox(height: 10),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Unfilled field';
                  }
                },
                onSaved: (value) {
                  _Trip_price = int.parse(value!);
                },
                decoration: InputDecoration(
                    hintText: "Trip price",
                    labelStyle: TextStyle(fontSize: 24, color: Colors.black),
                    border: InputBorder.none,
                    fillColor: Colors.black12,
                    filled: true),
                obscureText: false,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Add Museum Photo"),
                  IconButton(
                    icon: Icon(
                      Icons.camera,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      URL_result = await _store.getImage();
                      _store.setimage(URL_result);
                      _store.getimageurl();
                      print("asd $URL_result");
                    },
                  ),
                ],
              ),
              SizedBox(height: 10),
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
              SizedBox(height: 10),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Unfilled field';
                  }
                },
                onSaved: (value) {
                  picking_place = value!;
                },
                decoration: InputDecoration(
                    hintText: "Picking Place",
                    labelStyle: TextStyle(fontSize: 24, color: Colors.black),
                    border: InputBorder.none,
                    fillColor: Colors.black12,
                    filled: true),
                obscureText: false,
                maxLength: 20,
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        {
                          formKey.currentState!.reset();
                        }
                      },
                      child: Text("reset")),
                  ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();

                        await _store.addTrip(Trip(
                          Trip_name: _Museum_Name,
                          imagePath: _store.getimageurl(),
                          liked: false,
                          Location: _Location,
                          Trip_description: _Trip_description,
                          Trip_price: _Trip_price,
                          Trip_Types: Trips.NA,
                          tid: '',
                          pl: picking_place,
                          
                        ));
                      }
                      Helper.nextScreen(context, ManageProducts());
                    },
                    child: Text("Submit"),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
