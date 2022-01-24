import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rz_tours/providers/Trips_provider.dart';
import 'package:rz_tours/screens/cart_.dart';
import 'package:rz_tours/services/trips_data.dart';
import 'package:rz_tours/utils/constants.dart';
import 'package:rz_tours/utils/helper.dart';
import 'package:rz_tours/widgets/custom_app_bar.dart';
import 'package:rz_tours/widgets/Search_widget.dart';
import 'package:rz_tours/widgets/Trips_card.dart';

class Trips_home extends StatelessWidget {
  String View = "Trips";
  final _store = TripsData();
  get fontSize15 => null;
  @override
  Widget build(BuildContext context) {
    return Consumer<TripsProvider>(builder: (context, trips, child) {
      return Scaffold(
        appBar: AppBar(
        title: Text(
          "Products",
        ),
        backgroundColor: Colors.amber,
        elevation: 0.0,
        centerTitle: true,
        actions: <Widget>[
    IconButton(
      icon: Icon(
        Icons.shopping_cart,
        color: Colors.black,
      ),
      onPressed: () {
        Helper.nextScreen(context, CartView());
      },
        
        )]),
        body:  StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Muesums')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return SingleChildScrollView(
                    child: SafeArea(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                      "Choose Your Next Visit",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        letterSpacing: 0.6,
                        wordSpacing: 0.6,
                      ),
                    ),
                            SizedBox(
                              height: 20.0,
                            ),
                           
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: ScreenUtil().setHeight(52.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color.fromRGBO(255, 136, 0, 1),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                          primary: Colors.black),
                                      onPressed: () {
                                        View = "Trips";
                                      },
                                      child: Text('Cairo Museums'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: ScreenUtil().setHeight(52.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color.fromRGBO(255, 136, 0, 1),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                          primary: Colors.black),
                                      onPressed: () {
                                        View = "Musume";
                                      },
                                      child: Text('Giza Museums'),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 25.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "New Trips",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Constants.blackColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "View all",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25.0,
                            ),
                            if (View == "Trips")
                              FutureBuilder(
                                  future: //_store.fetch2(),
                                      trips.fetchTrips(),
                                  builder: (context, snapshot) {
                                    return ListView.separated(
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return SizedBox(
                                          height: 15.0,
                                        );
                                      },
                                      itemCount: trips.basketItems.length,
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        
                                        return TripCard(
                                          trips.basketItems[index].Trip_name,
                                          trips.basketItems[index].Trip_price,
                                          trips.basketItems[index]
                                              .Trip_description,
                                          trips.basketItems[index].Location,
                                          trips.basketItems[index].tid,
                                          trips.basketItems[index].pl,
                                          trips.basketItems[index].imagePath
                                        );
                                      },
                                    );
                                  })
                          ],
                        ),
                      ),
                    ),
                  );
                }),
      );
    });
  }
}
