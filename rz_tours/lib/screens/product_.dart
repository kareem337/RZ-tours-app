import 'package:flutter/material.dart';
import 'package:rz_tours/widgets/products.dart';

class CartView extends StatefulWidget {
  CartView({Key? key}) : super(key: key);

  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shopping Cart',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 21.0,
          ),
        ),
        backgroundColor: Colors.indigo,
        elevation: 0.0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          CartItem('background.jpg', 'hello', 10),
          CartItem('background.jpg', 'hello', 10),
          CartItem('background.jpg', 'hello', 10),
          CartItem('background.jpg', 'hello', 10),
          CartItem('background.jpg', 'hello', 10),
          CartItem('background.jpg', 'hello', 10),
          CartItem('background.jpg', 'hello', 10),
          CartItem('background.jpg', 'hello', 10),
          SizedBox(height: 20.0),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              Text(
                '\$ 600',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Delivery Charge',
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              Text(
                '\$ 30',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sub Total',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '\$ 630',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Spacer(),
          SizedBox(height: 10.0),
          MaterialButton(
            onPressed: () {},
            color: Colors.indigo,
            height: 50.0,
            minWidth: double.infinity,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Text(
              'PROCEED TO CHECKOUT',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
