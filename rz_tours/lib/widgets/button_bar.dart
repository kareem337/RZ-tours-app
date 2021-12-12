import 'package:flutter/material.dart';
import 'package:rz_tours/screens/chat.dart';
import 'package:rz_tours/screens/product_.dart';

class Buttom extends StatelessWidget {
  const Buttom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(
                  Icons.home,
                  size: 20,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  size: 20,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartView()));
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.perm_phone_msg_sharp,
                  size: 20,
                ),
                onPressed: () {},
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Chat()));
                },
                icon: Icon(
                  Icons.message,
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
