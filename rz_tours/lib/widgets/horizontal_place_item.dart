import 'package:flutter/material.dart';
import 'package:rz_tours/screens/product_view.dart';
import 'package:rz_tours/screens/products.dart';
import 'package:rz_tours/utils/helper.dart';


class HorizontalPlaceItem extends StatelessWidget {
   final String name;
  final String location;
  final String imagePath;
  final int price;
  final String descrition;
  final String pl;
  HorizontalPlaceItem(this.name,this.location,this.imagePath,this.price,this.descrition,this.pl);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: InkWell(
        child: Container(
          height: 250.0,
          width: 140.0,
          child: ListView(
            children: <Widget>[
              Container(
                height: 178.0,
                         width: 140.0,
                    decoration: BoxDecoration(
                      
                      borderRadius: BorderRadius.circular(18.0),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        
                        image: //AssetImage('assets/luxor.jpg'), 
                        NetworkImage(imagePath)
                      ),
                    ),
                  ),
              SizedBox(height: 7.0),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 3.0),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  location,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13.0,
                    color: Colors.blueGrey[300],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          Helper.nextScreen(context,CartScreen(name,price,descrition,pl,imagePath));

        },
      ),
    );
  }
}
