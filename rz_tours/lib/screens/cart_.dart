import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rz_tours/providers/cart_provider.dart';
import 'package:rz_tours/providers/product_provider.dart';
import 'package:rz_tours/screens/home.dart';
import 'package:rz_tours/utils/helper.dart';
import 'package:rz_tours/widgets/custom_app_bar.dart';
import 'package:rz_tours/widgets/cart.dart';

class CartView extends StatefulWidget {
  CartView({Key? key}) : super(key: key);

  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: CustomAppBar('Cart'),
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<CartProvider>(
                builder: (context, CartProvider data, chil) {
              return data.getCarts.length != 0
                  ? ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return CartItem(data.getCarts[index], index);
                      },
                    )
                  : GestureDetector(
                      onTap: () {},
                      child: Center(
                          child: Text(
                        "Add Products",
                        style: TextStyle(color: Colors.white),
                      )),
                    );
            })),
      ),
 
    );
  }
}
