import 'package:flutter/material.dart';
import 'package:rz_tours/widgets/product.dart';

class Product extends StatefulWidget {
  Product({Key? key}) : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
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
          ProductItem('Tahrir museum.jpg', 'Egyptain Museum ', 10, 'sdfh'),
          ProductItem('Coptic Museum.jpg', 'Coptic Museum', 10, 'fds'),
          ProductItem('Abdeen.jpg', 'Abdeen', 10, 'gfds'),
          ProductItem('El baron Palace.jpg', 'El Baron Palace', 10, 'gf'),
          ProductItem('Alex.jpg', 'Alex', 10, 'gg'),
          ProductItem('luxor.jpg', 'Luxor', 10, 'h'),
          ProductItem('abu simple.jpg', 'Aswan', 10, 'kk'),
          ProductItem('dahab.jpg', 'Dahab', 10, 'jkj'),
        ],
      ),
    );
  }
}
