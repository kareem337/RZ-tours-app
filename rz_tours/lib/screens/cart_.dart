import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rz_tours/models/user_cart.dart';
import 'package:rz_tours/providers/cart_provider.dart';
import 'package:rz_tours/utils/helper.dart';
import 'package:rz_tours/widgets/cart.dart';
import 'home.dart';

class CartView extends StatefulWidget {
  CartView({Key? key}) : super(key: key);

  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  List yourItemList = [];
  DateTime currentDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, cart, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Total Price [\$ ${cart.totalPrice}]'),
          backgroundColor: Colors.amber,
          elevation: 0.0,
          centerTitle: true,
        ),
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
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: cart.basketItems.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                              height: 290,
                              child: Column(
                                children: [
                                  CartItem(
                                      cart.basketItems[index].name,
                                      cart.basketItems[index].price,
                                      cart.basketItems[index].quantity,
                                      cart.basketItems[index].image,
                                      ),
                                  Expanded(
                                    child: IconButton(
                                        onPressed: () {
                                          cart.remove(cart.basketItems[index]);
                                        },
                                        icon: Icon(Icons.delete_outlined)),
                                  ),
                                ],
                              ));
                        }),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      width: 230,
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.amber,
                          ),
                          onPressed: () {
                            for (int i = 0; i < cart.count; i++) {
                              cart.bookOrder(UserCart(
                                  cart.basketItems[i].name,
                                  cart.totalPrice,
                                  cart.basketItems[i].dateTime,
                                  cart.basketItems[i].quantity,
                                  cart.basketItems[i].image
                                  
                                  ));
                            }
                            cart.removeAll();
                            Helper.nextScreen(context, Home());
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Ordered Placed Successfully')),
                            );
                          },
                          child: Text(
                            'Book Your Order',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w900,
                            ),
                          )),
                    ),
                  )
                ],
              ),
      );
    });
  }
}
