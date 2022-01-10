import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rz_tours/models/cart_model.dart';
import 'package:rz_tours/screens/cart_.dart';
import 'package:rz_tours/utils/helper.dart';
import 'package:rz_tours/widgets/app_bar.dart';
import 'package:rz_tours/widgets/custom_app_bar.dart';
import 'package:rz_tours/widgets/drawer.dart';

import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  TimeOfDay _time = TimeOfDay(hour: 7, minute: 15);

  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(
        //bet7aded size lel appbar
        preferredSize: Size.fromHeight(50.0),
        child: CustomAppBar('Product'),
      ),
      drawer: DrawerWidget(),
      body: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        child: ListView(
          children: [
            Center(
              child: Text(
                "Egyptian Museum",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  fontFamily: "italic",
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
      
                CircleAvatar(
                  backgroundImage: AssetImage("assets/Trip-1.png"),
                  radius: 100,
                  // child: Image.network(
                  //   height: 150,
                  //   width: 100,
                  // ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Place:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Egyptian Musuem",
                        style: TextStyle(fontSize: 16, fontFamily: "italic"),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Picking Place:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "NasrCity,Cairo International Stadium",
                        style: TextStyle(fontSize: 16, fontFamily: "italic"),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Time:",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.amber),
              onPressed: _selectTime,
              child: Text('SELECT TIME', style: TextStyle(color: Colors.white),),
            ),
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Date:",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )),
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              DatePicker.showDatePicker(context,
                                  showTitleActions: true,
                                  minTime: DateTime(2021, 12, 21),
                                  maxTime: DateTime(2022, 2, 2),
                                  onChanged: (date) {
                                print('change $date');
                              }, onConfirm: (date) {
                                print('confirm $date');
                              },
                                  currentTime: DateTime.now());
                                  //locale: LocaleType.zh);
                            },
                            style: ElevatedButton.styleFrom(primary: Colors.amber),
                            child: Text(
                              'SELECT DATE',
                              style: TextStyle(color: Colors.white),
                            )))
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {
                      Helper.nextScreen(context, CartView());
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.amber),
                    child: Text(
                      "Go To Payement",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
