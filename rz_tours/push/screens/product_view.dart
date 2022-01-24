import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rz_tours/models/user_cart.dart';
import 'package:rz_tours/providers/cart_provider.dart';
import 'package:rz_tours/widgets/custom_app_bar.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class CartScreen extends StatefulWidget {
  final String name;
  final String pl;
  final String description;
  final int price;

  CartScreen(this.name, this.price, this.description, this.pl);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  TimeOfDay _time = TimeOfDay(hour: 12, minute: 00);
  late DateTime date;
  final format = DateFormat("yyyy-MM-dd HH:mm");
  late DateTime dt;
  late Timestamp myTimeStamp;
int quantity=1;
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, cart, child) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: CustomAppBar('Product'),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          child: ListView(
            children: [
              Center(
                child: Text(
                  widget.name,
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
                          widget.name,
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
                          widget.pl,
                          style: TextStyle(fontSize: 16, fontFamily: "italic"),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),

                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (quantity > 1) {
                                quantity--;
                              }
                            });
                          },
                          icon: Icon(
                            Icons.remove,
                          ),
                        ),
                        Text(
                          '$quantity',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          icon: Icon(
                            Icons.add,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50,),
                  Column(children: <Widget>[
                    Text(
                      "Pick Date And Time",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    DateTimeField(
                      validator: (value) {
                        if ((value.toString().isEmpty) ||
                            (DateTime.tryParse(value.toString()) == null)) {
                           ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Please Select Date And Time')));
                        }
                        return null;
                      },
                      format: format,
                      onShowPicker: (context, currentValue) async {
                        final date = await showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            initialDate: currentValue ?? DateTime.now(),
                            lastDate:
                                DateTime.now().add(Duration(hours: 24 * 30)));
                        if (date != null) {
                          final time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.fromDateTime(
                                currentValue ?? DateTime.now()),
                          );

                          dt = DateTimeField.combine(date, time);
                          return dt;
                        } else {
                          return currentValue;
                        }
                      },
                    ),
                  ]),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        cart.addNames(UserCart(widget.name, widget.price, dt,quantity));
                        cart.add(UserCart(widget.name, widget.price, dt,quantity));
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Added To Cart')));
                        //Helper.nextScreen(context, CartView());
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.amber),
                      child: Text(
                        "Add To Cart",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
