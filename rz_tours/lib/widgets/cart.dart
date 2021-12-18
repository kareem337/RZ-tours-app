import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  late String image;
  late String name;
  late double price;
  CartItem(this.image, this.name, this.price);

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
                    image: AssetImage('assets/${this.image}'),
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
                        '${this.name}',
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
                  '${this.price} L.E',
                  style: TextStyle(),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.remove,
                        ),
                      ),
                      Text(
                        '1',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
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