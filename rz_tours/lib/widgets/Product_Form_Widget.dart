
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:rz_tours/models/Trips.dart';
import 'package:rz_tours/utils/Auth.dart';
import 'package:rz_tours/utils/Store.dart';
import 'package:rz_tours/widgets/Custom_textfield.dart';
import '';
//
import 'Form_textformfield.dart';

class Form_page extends StatefulWidget {

  //const Form_page({ Key? key}) : super(key: key);
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<Form_page> {
  static String id="Addprouct";
  final _auth =Auth();
  final formKey = GlobalKey<FormState>();
  final  _store =Store();
  final controller = TextEditingController();
  String category = 'Category1';

  @override
  Widget build(BuildContext context) {
String _Museum_Name="",_Trip_description="",_Trip_price="",_Location="",_Image="";
bool _Trip_type=false;
    return Form(
      key: formKey,
      child: Column(
        children:[ 
          SizedBox(height: 10),
          CustomTextField(
            hint:"Museum Name",
            onClick:(value)
            {
              _Museum_Name=value;
            }, 
            ),
            SizedBox(height: 10),
            CustomTextField(
            hint:"Trip description ",
            onClick:(value)
            {
              _Trip_description=value;
            }
            ),
            SizedBox(height: 10),
            CustomTextField(
            hint:"Trip price",
             onClick :(value)
            {
              _Trip_price=value;
            },
            ),
            SizedBox(height: 10),
            CustomTextField(
              onClick :(value)
            {
              _Location=value;
            },
            hint:"Location"
            ),
            SizedBox(height: 10),
            CustomTextField(
              onClick :(value)
            {
              _Trip_type=value;
            },
            hint:"Trip type"
            ),
            SizedBox(height: 10),
            CustomTextField(
              onClick :(value)
            {
              _Image=value;
            },
            hint:"Image"
            ),
            ElevatedButton(
              onPressed: (){
                 if(formKey.currentState!.validate()){
                   formKey.currentState!.reset();
              
                 }
              }
            , child: Text("reset")
            ),
            ElevatedButton(
              onPressed: (){
                 if(formKey.currentState!.validate()){
                   formKey.currentState!.save();
                  _store.addTrip(Trip(
                    museum_name: _Museum_Name,
                    imagePath: _Image,
                    liked: false, 
                    Location: _Location, 
                    Trip_description: _Trip_description, 
                    Trip_price: _Trip_price, Trip_Types: Trips.NA, 
                    
                  )
                  );    
               }
              }
            , child: Text("Submit")
            )
        ]
      ),
    );
  }
}
  
  
