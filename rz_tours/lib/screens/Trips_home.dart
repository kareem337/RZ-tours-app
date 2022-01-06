import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rz_tours/screens/search_result.dart';
import 'package:rz_tours/utils/constants.dart';
import 'package:rz_tours/utils/helper.dart';
import 'package:rz_tours/utils/static_data.dart';
import 'package:rz_tours/widgets/Tickets_card.dart';
import 'package:rz_tours/widgets/custom_app_bar.dart';
import 'package:rz_tours/widgets/drawer.dart';
import 'package:rz_tours/widgets/Search_widget.dart';
import 'package:rz_tours/widgets/Trips_card.dart';

class Trips_home extends StatelessWidget {
  String View ="Trips" ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: CustomAppBar('Products'),
      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
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
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Find Your Next Trip\n",
                        style: TextStyle(
                          fontSize: 22.0,
                          height: 1.3,
                          color: Color.fromRGBO(22, 27, 40, 70),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SearchWidget(
                        height: 44.0,
                        hintText: "Search For your Next Trip",
                        prefixIcon: Icons.search,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      height: ScreenUtil().setHeight(44.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                              Constants.amberColor,
                            ),
                            padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                horizontal: 15.0,
                              ),
                            )),
                        onPressed: () {
                          Helper.nextScreen(context,SearchResult());
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              "Search",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
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
                       child:TextButton(
                        style: TextButton.styleFrom(primary: Colors.black),
                        onPressed: () {
                          View ="Trips";
                        },
                       child: Text('Trips Tickets'),
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
                        child:TextButton(
                        style: TextButton.styleFrom(primary: Colors.black),
                        onPressed: () {
                          View ="Musume";
                        },
                       child: Text('Musume Tickets'),
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
                if(View =="Trips")
                ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 15.0,
                    );
                  },
                  itemCount: StaticData.SomeTrips.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return TripCard(
                      trip: StaticData.SomeTrips[index],

                    );
                  },
                )
                else
                 ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 15.0,
                    );
                  },
                  itemCount: StaticData.SomeTickets.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return TicketsCard(
                      tickets: StaticData.SomeTickets[index],

                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
