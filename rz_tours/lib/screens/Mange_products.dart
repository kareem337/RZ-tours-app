import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rz_tours/models/Trips.dart';
import 'package:rz_tours/utils/Store.dart';
import 'package:rz_tours/utils/constants.dart';
import 'package:rz_tours/widgets/admin_Drawer.dart';
import 'package:rz_tours/widgets/manage_product_menu.dart';

class ManageProducts extends StatefulWidget {
  static String id = 'ManageProducts';
  @override
  _ManageProductsState createState() => _ManageProductsState();
}

class _ManageProductsState extends State<ManageProducts> {
  final _store = Store();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Trips page',
          style: TextStyle(color: Colors.black),
        ),
      ),
      drawer: MobileDrawer(),
      body: StreamBuilder<QuerySnapshot>(
        stream: _store.loadTrips(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //        async{
            // List<Trip> tr = await _store.fecthdata();
            List<Trip> trips = [];
            // trips = tr;
            //       }

            for (var doc in snapshot.data!.docs) {
              var data = doc.data() as dynamic;
              String id = doc.reference.id;
              //var data = snapshot.data!.docs;

              trips.add(
                Trip(
                  tripid: id,
                  Trip_name: data[museum_name],
                  Trip_description: data[Trip_description],
                  Location: data[Location],
                  Trip_price: data[Trip_price],
                  imagePath: data[imagePath],
                  liked: false,
                  Trip_Types: Trips.OUT_OF_CAIRO,
                  //T_Quantity: null
                ),
              );
            }
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .8,
              ),
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: GestureDetector(
                  onTapUp: (details) async {
                    double dx = details.globalPosition.dx;
                    double dy = details.globalPosition.dy;
                    double dx2 = MediaQuery.of(context).size.width - dx;
                    double dy2 = MediaQuery.of(context).size.width - dy;
                    await showMenu(
                        context: context,
                        position: RelativeRect.fromLTRB(dx, dy, dx2, dy2),
                        items: [
                          MyPopupMenuItem(
                            onClick: () {
                              Navigator.pushNamed(
                                  context, "EditProduct", //edit product page
                                  arguments: trips[index]);
                            },
                            child: Text('Edit'),
                          ),
                          MyPopupMenuItem(
                            onClick: () {
                              _store.deleteProduct(trips[index].tripid);
                              Navigator.pop(context);
                            },
                            child: Text('Delete'),
                          ),
                        ]);
                  },
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: Image(
                          fit: BoxFit.fill,
                          image: AssetImage(trips[index].imagePath),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Opacity(
                          opacity: .6,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 60,
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    trips[index].Trip_name,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text('\$ ${trips[index].Trip_price}')
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              itemCount: trips.length,
            );
          } else {
            return Center(child: Text('Loading...'));
          }
        },
      ),
    );
  }
}
