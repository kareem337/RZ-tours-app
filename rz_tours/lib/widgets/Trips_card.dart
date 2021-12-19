import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rz_tours/models/Trips.dart';
import 'package:rz_tours/screens/product_view.dart';
import 'package:rz_tours/screens/cart_.dart';
import 'package:rz_tours/utils/constants.dart';
import 'package:rz_tours/utils/helper.dart';

class TripCard extends StatelessWidget {
  final Trip trip;
  TripCard({required this.trip});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(250.0),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.0),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        trip.imagePath,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10.0,
                  right: 10.0,
                  child: InkWell(
                    onTap: () { Helper.nextScreen(context, CartScreen());},
                    child: Container(
                      width: 45.0,
                      height: 45.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.visibility,
                        color: this.trip.liked
                            ? Color.fromRGBO(255, 136, 0, 1)
                            : Color(0xFFC4C4C4),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -15.0,
                  left: 10.0,
                  child: Container(
                    width: 45.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: this.trip.Trip_Types == Trips.IN_CAIRO
                          ? Constants.primaryColor
                          : Color.fromRGBO(255, 136, 0, 1),
                    ),
                    child: Center(
                      child: Text(
                        this.trip.Trip_Types == Trips.IN_CAIRO
                            ? "In Cairo"
                            : "Outside Cairo",
                        style: TextStyle(
                          fontSize: 8.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
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
                        trip.museum_name,
                        style: TextStyle(
                          fontSize: 17.0,
                        ),
                      ),
                    ),
                    Text(
                      trip.Trip_price,
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
                  trip.Trip_description,
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
                      Icons.map,
                      size: 15.0,
                      color: Color.fromRGBO(255, 136, 0, 1),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      trip.Location,
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
