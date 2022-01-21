import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rz_tours/models/Museum_tickets.dart';
import 'package:rz_tours/models/Trips.dart';
import 'package:rz_tours/screens/product_view.dart';
import 'package:rz_tours/screens/search_result.dart';
import 'package:rz_tours/utils/constants.dart';
import 'package:rz_tours/utils/helper.dart';

class TripCard extends StatefulWidget {
  //final Trip trip;
  final String name;
  final String description;
  final String location;
  final int price;
 // final String image;

 // TripCard({required this.trip});
  TripCard( this.name, this.price, this.description, this.location);

  @override
  _TripCardState createState() => _TripCardState();
}

class _TripCardState extends State<TripCard> {
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(250.0),
      child: Column(
        children: [
          Expanded(
            child:InkWell(
            onTap: () {
              Helper.nextScreen(context,CartScreen());
            },
            child: Stack(
              clipBehavior: Clip.none,
              
              children: [
                Container(
      
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.0),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/Abdeen.jpg'
                        
                      ),
                    ),
                  ),
                ),
            
                Positioned(
                  top: 10.0,
                  right: 10.0,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if(flag)
                        flag=false;
                        else flag = true;
                      });
                      
                    },
                    child: Container(
                      width: 45.0,
                      height: 45.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    child: Icon(
                        Icons.favorite,
                        color: flag
                            ? Color.fromRGBO(255, 136, 0, 1)
                            : Colors.grey,
            
                        
                      ),
                    ),
                  ),
                ),
                // Positioned(
                //   bottom: -15.0,
                //   left: 10.0,
                //   child: Container(
                //     width: 45.0,
                //     height: 45.0,
                //     decoration: BoxDecoration(
                //       shape: BoxShape.circle,
                //       color: this.widget.trip.Trip_Types == Trips.IN_CAIRO
                //           ? Constants.primaryColor
                //           : Color.fromRGBO(255, 136, 0, 1),
                //     ),
                //     child: Center(
                //       child: Text(
                //         this.widget.trip.Trip_Types == Trips.IN_CAIRO
                //             ? "In Cairo"
                //             : "Outside",
                //         style: TextStyle(
                //           fontSize: 10.0,
                //           color: Colors.white,
                //         ),
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                       widget.name,
                        style: TextStyle(
                          fontSize: 17.0,
                        ),
                      ),
                    ),
                    Text(
                      widget.price.toString(),
                      style: TextStyle(
                        fontSize: 17.0,
                        color: Constants.primaryColor,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  widget.description,
                  style: TextStyle(
                    fontSize: 13.0,
                    color: Color(0xFF343434),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.search_outlined,
                      size: 15.0,
                      color: Color.fromRGBO(255, 136, 0, 1),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      widget.location,
                      style: TextStyle(
                        fontSize: 13.0,
                        color: Color(0xFF343434),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
