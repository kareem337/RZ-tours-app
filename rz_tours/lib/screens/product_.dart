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
          'Mueseums and trips',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 21.0,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          CartItem('Tahrir museum.jpg', 'Egyptain Museum ', 10),
          CartItem('Coptic Museum.jpg', 'Coptic Museum', 10),
          CartItem('Abdeen.jpg', 'Abdeen', 10),
          CartItem('El baron Palace.jpg', 'El Baron Palace', 10),
          CartItem('Alex.jpg', 'Alex', 10),
          CartItem('luxor.jpg', 'Luxor', 10),
          CartItem('abu simple.jpg', 'Aswan', 10),
          CartItem('dahab.jpg', 'Dahab', 10),
          SizedBox(height: 20.0),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Total',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              Text(
                '\$',
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
            children: [],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [],
          ),
          Spacer(),
          SizedBox(height: 10.0),
          MaterialButton(
            onPressed: () {},
            color: Colors.black,
            height: 50.0,
            minWidth: double.infinity,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Text(
              'ADD TO CART',
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
