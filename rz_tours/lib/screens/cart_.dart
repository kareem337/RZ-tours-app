import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rz_tours/providers/cart_provider.dart';
import 'package:rz_tours/utils/helper.dart';
import 'package:rz_tours/widgets/custom_app_bar.dart';
import 'package:rz_tours/widgets/cart.dart';

import 'home.dart';

class CartView extends StatefulWidget {
  CartView({Key? key}) : super(key: key);

  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, cart, child) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: CustomAppBar('Cart [\$ ${cart.totalPrice}]'),
        ),
        bottomNavigationBar: MaterialButton(
            onPressed: () {
              cart.removeAll();
              Helper.nextScreen(context, Home());
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Purchased Successfully')),
              );
            },
            color: Colors.amber,
            height: 50.0,
            minWidth: double.infinity,
            shape: RoundedRectangleBorder(
                //borderRadius: BorderRadius.circular(20.0),
                ),
            child: Text(
              'Book Your Order',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.w400,
              ),
            )),
        body: cart.basketItems.length == 0
            ? Center(
                child: Text(
                  'THERE ARE NO ITEMS IN YOUR CART',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: cart.basketItems.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                      height: 290,
                      child: Column(
                        //padding: const EdgeInsets.all(16.0),
                        children: [
                          CartItem(
                              cart.basketItems[index].productImage,
                              cart.basketItems[index].name,
                              cart.basketItems[index].price),
                          IconButton(
                              onPressed: () {
                                cart.remove(cart.basketItems[index]);
                              },
                              icon: Icon(Icons.delete_outlined)),
                          SizedBox(height: 10.0),
                        ],
                      ));
                }),
      );
    });
  }
}
