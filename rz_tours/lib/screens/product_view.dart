import 'package:cloud_firestore/cloud_firestore.dart';
<<<<<<< Updated upstream
=======
import 'package:flutter/cupertino.dart';
>>>>>>> Stashed changes
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rz_tours/models/user_cart.dart';
import 'package:rz_tours/providers/cart_provider.dart';
<<<<<<< Updated upstream
import 'package:rz_tours/screens/cart_.dart';
import 'package:rz_tours/utils/constants.dart';
import 'package:rz_tours/utils/helper.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
=======
import 'package:rz_tours/widgets/custom_app_bar.dart';
//import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
>>>>>>> Stashed changes
import 'package:intl/intl.dart';

class CartScreen extends StatefulWidget {
  final String name;
  final String pl;
  final String description;
  final int price;
<<<<<<< Updated upstream
  String imagePath2;
  CartScreen(this.name, this.price, this.description, this.pl,this.imagePath2);
=======

  CartScreen(this.name, this.price, this.description, this.pl);
>>>>>>> Stashed changes

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
<<<<<<< Updated upstream
final _formKey = GlobalKey<FormState>();
=======
>>>>>>> Stashed changes
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, cart, child) {
      return Scaffold(
<<<<<<< Updated upstream
        appBar: AppBar(
        title: Text(
          "Products",
        ),
        backgroundColor: Colors.amber,
        elevation: 0.0,
        centerTitle: true,
        actions: <Widget>[
    IconButton(
      icon: Icon(
        Icons.shopping_cart,
        color: Colors.black,
      ),
      onPressed: () {
        Helper.nextScreen(context, CartView());
      },
        
        )]),
=======
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: CustomAppBar('Product'),
        ),
>>>>>>> Stashed changes
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
                  // CircleAvatar(
                  //   backgroundImage: NetworkImage(widget.imagePath2),
                  //   radius: 100,
                  //   // child: Image.network(
                  //   //   height: 150,
                  //   //   width: 100,
                  //   // ),
                  // ),
                  Container(
                height: 220.0,
                         width: 240.0,
                    decoration: BoxDecoration(
                      
                      borderRadius: BorderRadius.circular(18.0),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        
                        image: //AssetImage('assets/luxor.jpg'), 
                        NetworkImage(widget.imagePath2)
                      ),
                    ),
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
<<<<<<< Updated upstream
                          style: TextStyle(fontSize: 20, fontFamily: "italic"),
=======
                          style: TextStyle(fontSize: 16, fontFamily: "italic"),
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
                          style: TextStyle(fontSize: 20, fontFamily: "italic"),
=======
                          style: TextStyle(fontSize: 16, fontFamily: "italic"),
>>>>>>> Stashed changes
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),

                  Row(
<<<<<<< Updated upstream
                    children: [
                      Expanded(
                        child: Text(
                          "Ticket Price:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "${widget.price.toString()} LE",
                          style: TextStyle(fontSize: 20, fontFamily: "italic"),
                        ),
                      )
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
=======
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
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
                    Form(
                      key: _formKey,
                      child: DateTimeField(
                        
                        validator: (value) {
                          if ((value.toString().isEmpty) ||
                              (DateTime.tryParse(value.toString()) == null)) {
                             return "Please pick Date and Time";
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
                    ),
=======
                    // DateTimeField(
                    //   validator: (value) {
                    //     if ((value.toString().isEmpty) ||
                    //         (DateTime.tryParse(value.toString()) == null)) {
                    //        return "Please Select Date And Time";
                    //     }
                    //     return null;
                    //   },
                    //   format: format,
                    //   onShowPicker: (context, currentValue) async {
                    //     final date = await showDatePicker(
                    //         context: context,
                    //         firstDate: DateTime.now(),
                    //         initialDate: currentValue ?? DateTime.now(),
                    //         lastDate:
                    //             DateTime.now().add(Duration(hours: 24 * 30)));
                    //     if (date != null) {
                    //       final time = await showTimePicker(
                    //         context: context,
                    //         initialTime: TimeOfDay.fromDateTime(
                    //             currentValue ?? DateTime.now()),
                    //       );

                    //       dt = DateTimeField.combine(date, time);
                    //       return dt;
                    //     } else {
                    //       return currentValue;
                    //     }
                    //   },
                    // ),
>>>>>>> Stashed changes
                  ]),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                      onPressed: () {
<<<<<<< Updated upstream
                        if (_formKey.currentState!.validate())
                        {
                        cart.addNames(UserCart(widget.name, widget.price, dt,quantity,widget.imagePath2));
                        cart.add(UserCart(widget.name, widget.price, dt,quantity,widget.imagePath2));
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Added To Cart')));
                        }
=======
                        cart.addNames(UserCart(widget.name, widget.price, dt,quantity));
                        cart.add(UserCart(widget.name, widget.price, dt,quantity));
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Added To Cart')));
>>>>>>> Stashed changes
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
