import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rz_tours/providers/Trips_provider.dart';
import 'package:rz_tours/screens/Trips_home.dart';
import 'package:rz_tours/screens/cart_.dart';
import 'package:rz_tours/utils/helper.dart';
import 'package:rz_tours/widgets/drawer.dart';
import 'package:rz_tours/widgets/horizontal_place_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        drawer: DrawerWidget(),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Explore the beauty of \nEgypt",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Top Destinations",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              buildHorizontalList(context),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Most Visted",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              buildHorizontalList(context),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                      "Rz tours Offers variety of services where you will get the best experience in visiting museums. We will serve you from the day you will book the ticket to the moment you exit the museum. We hope you to have a great experience with us.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        letterSpacing: 0.6,
                        wordSpacing: 0.6,
                      ),
                    ),
              ),
              TextButton(
                      onPressed: () {
                        Helper.nextScreen(context, Trips_home());
                      },
                      child: Text(
                        "View Museums >>>",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    )
              //cards(context),
            ],
          ),
        ));
  }

  buildHorizontalList(BuildContext context) {
    return Consumer<TripsProvider>(builder: (context, trips, child){
    return Container(
      padding: EdgeInsets.only(top: 10.0, left: 20.0),
      height: 270.0,
      child:  FutureBuilder(
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
                                      //physics: NeverScrollableScrollPhysics(),
                                      //shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        
                                        return HorizontalPlaceItem(
                                          trips.basketItems[index].Trip_name,
                                          trips.basketItems[index].Location,
                                          trips.basketItems[index].imagePath,
                                           trips.basketItems[index].Trip_price,
                                          trips.basketItems[index].Trip_description,
                                          trips.basketItems[index].pl
                                        );
                                      },
                                    );
                                  })
    );});
  }

  cards(BuildContext context) {
    return Consumer<TripsProvider>(builder: (context, trips, child) {
      return Container(
        child: Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.amber),
              onPressed: () {
                Provider.of<TripsProvider>(context, listen: false).fetchTrips();
                //trips.fetchTrips();

                Helper.nextScreen(context, Trips_home());
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 300,
                height: 60,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.home),
                      Text(
                        "  Hotels",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.amber),
              onPressed: () {
                Provider.of<TripsProvider>(context, listen: false).fetchTrips();
                Helper.nextScreen(context, Trips_home());
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 300,
                height: 60,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.flight),
                      Text(
                        "  Trips",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.amber),
              onPressed: () {
                Provider.of<TripsProvider>(context, listen: false).fetchTrips();
                Helper.nextScreen(context, Trips_home());
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 300,
                height: 60,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.directions_boat),
                      Text(
                        "  Cruises",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.amber),
              onPressed: () {
                Helper.nextScreen(context, Trips_home());
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 300,
                height: 60,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_bag),
                      Text(
                        "  Packages",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
