import 'package:flutter/material.dart';
import 'package:rz_tours/models/cart_model.dart';
import 'package:rz_tours/models/product_model.dart';

class CartItem extends StatefulWidget {
  final Cart carts;
  int index;
  CartItem(this.carts, this.index);

  @override
  _CartItemState createState() => _CartItemState();
}

int counter = 1;

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
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
                    //${this.widget.image}
                    image: AssetImage('assets/Trip-1.png'),
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
                        //${this.widget.name}
                        'ahmed amr',
                        style: TextStyle(),
                      ),
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.delete_outlined,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  //${this.widget.price}
                  '11 L.E',
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
  }
}
