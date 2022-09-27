import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rz_tours/providers/cart_provider.dart';

class CartItem extends StatefulWidget {
<<<<<<< Updated upstream
  String name;
  int price;
  int quantity;
  String image;
  CartItem(this.name, this.price, this.quantity, this.image);
=======
  
  String name;
  int price;
  int quantity;
  CartItem( this.name, this.price,this.quantity);
>>>>>>> Stashed changes

  @override
  _CartItemState createState() => _CartItemState();
}

int counter = 1;

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, cart, child) {
      return Card(
        elevation: 5.0,
        child: Row(
          children: [
            Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.0),
                    image: DecorationImage(
<<<<<<< Updated upstream
                        fit: BoxFit.cover,
                        image: //AssetImage('assets/luxor.jpg'),
                            NetworkImage(this.widget.image)),
=======
                      image: AssetImage('assets/Abdeen.jpg'),
                      fit: BoxFit.fill,
                    ),
>>>>>>> Stashed changes
                  ),
                ),
              ],
            ),
            SizedBox(width: 12.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 150.0,
                        child: Text(
                          '${this.widget.name}',
                          style: TextStyle(),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '${this.widget.price} L.E',
                    style: TextStyle(),
                  ),
<<<<<<< Updated upstream
                  Text(
=======
                                    Text(
>>>>>>> Stashed changes
                    'Tickets: ${this.widget.quantity}',
                    style: TextStyle(),
                  ),

                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
