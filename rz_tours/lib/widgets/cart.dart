import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String image;
  final String name;
  final double price;
  CartItem(this.image, this.name, this.price);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(),
                child: Center(
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/${this.image}',
                        ),
                      ),
                    ),
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
                      width: 100.0,
                      child: Text(
                        '${this.name}',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: 15.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        '1',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: Colors.blue[300],
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 15.0,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '${this.price} \$',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
