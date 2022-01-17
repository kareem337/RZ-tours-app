import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rz_tours/providers/cart_provider.dart';

class CartItem extends StatefulWidget {
  String image;
  String name;
  double price;
  CartItem(this.image, this.name, this.price);

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
                  width: MediaQuery.of(context).size.width / 3,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/${this.widget.image}'),
                      fit: BoxFit.fill,
                    ),
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
                      Column(
                        children: [
                          // IconButton(
                          //   onPressed: () {
                          //     },
                          //   icon: Icon(
                          //     Icons.delete_outlined,
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    '${this.widget.price} L.E',
                    style: TextStyle(),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (counter > 1) {
                                counter--;
                              }
                            });
                          },
                          icon: Icon(
                            Icons.remove,
                          ),
                        ),
                        Text(
                          '$counter',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              counter++;
                            });
                          },
                          icon: Icon(
                            Icons.add,
                          ),
                        ),
                      ],
                    ),
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
