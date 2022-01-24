import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rz_tours/models/Trips.dart';
import 'package:rz_tours/utils/Store.dart';
import 'package:rz_tours/utils/constants.dart';
import 'package:rz_tours/widgets/admin_Drawer.dart';
import 'package:rz_tours/widgets/card_widget.dart';
import 'package:rz_tours/widgets/manage_product_menu.dart';
import 'package:rz_tours/widgets/Edit_form_widget.dart';

class ManageProducts extends StatefulWidget {
  static String id = 'ManageProducts';
  @override
  _ManageProductsState createState() => _ManageProductsState();
}

class _ManageProductsState extends State<ManageProducts> {
  final _store = Store();
  final formKey = GlobalKey<FormState>();
  String _Museum_Name = "";
  editfrom from = editfrom();
  Card_widgets card = Card_widgets();

  final controller = TextEditingController();
  final Namecontroller = TextEditingController();
  final Locationcontroller = TextEditingController();
  final Disccontroller = TextEditingController();
  final Imagecontroller = TextEditingController();
  final pricecontroller = TextEditingController();
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
                  tid: id,
                  Trip_name: data[museum_name],
                  Trip_description: data[Trip_description],
                  Location: data[Location],
                  Trip_price: data[Trip_price],
                  imagePath: data[imagePath],
                  liked: false,
                  Trip_Types: Trips.OUT_OF_CAIRO,
                  pl: data[pl]
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
                              //  Navigator.pushNamed(context, "editpage", arguments: trips[index].tripid);
                              // Helper.nextScreen(context,  Edit_Form_page());
                              showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                        child: Container(
                                          color: Colors.white54,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Form(
                                              child: ListView(
                                                shrinkWrap: true,
                                                children: [
                                                  from.buildTextField(
                                                      Namecontroller, "Name"),
                                                  SizedBox(height: 20),
                                                  from.buildTextField(
                                                      Locationcontroller,
                                                      "Location"),
                                                  SizedBox(height: 20),
                                                  from.buildTextField(
                                                      Disccontroller,
                                                      "Discripion"),
                                                  SizedBox(height: 20),
                                                  IconButton(
                                                    icon: Icon(
                                                        Icons.update_rounded),
                                                    onPressed: () {
                                                      //print(_Museum_Name);
                                                      // ignore: unnecessary_statements
                                                      snapshot.data!.docs[index]
                                                          .reference
                                                          .update({
                                                        museum_name:
                                                            Namecontroller.text,
                                                        Location:
                                                            Locationcontroller
                                                                .text,
                                                        Trip_description:
                                                            Disccontroller.text,
                                                      });
                                                      Navigator.of(context,
                                                              rootNavigator: true)
                                                          .pop("Done");
                                                    },
                                                  ) //child: Text("edit")),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ));
                            },
                            child: Text('Edit'),
                          ),
                          MyPopupMenuItem(
                            onClick: () {
                              _store.deleteProduct(trips[index].tid);
                              Navigator.pop(context);
                            },
                            child: Text('Delete'),
                          ),
                          MyPopupMenuItem(
                              onClick: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => Dialog(
                                            child: SingleChildScrollView(
                                          child: Container(
                                            child: Center(
                                              child: Card(
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.blue.withAlpha(30),
                                                  onTap: () {},
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        width: 150,
                                                        height: 150,
                                                        child: ClipRRect(
                                                          child:
                                                              Positioned.fill(
                                                            child: Image(
                                                              fit: BoxFit.fill,
                                                              //image: AssetImage(trips[index].imagePath),
                                                              image: NetworkImage(
                                                                  trips[index]
                                                                      .imagePath),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                          child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Text(
                                                              'Name: ${trips[index].Trip_name}'),
                                                          Text(
                                                              'Description: ${trips[index].Trip_description}'),
                                                          Text(
                                                              'Trip Type: ${trips[index].Trip_Types}')
                                                        ],
                                                      ))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )));
                                //card.Card_widget();
                              },
                              child: Text('View')),
                        ]);
                  },
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: Image(
                          fit: BoxFit.fill,
                          //image: AssetImage(trips[index].imagePath),
                          image: NetworkImage(trips[index].imagePath),
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
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Text(
                                          trips[index].Trip_name,
                                          maxLines: 1,
                                          softWrap: false,
                                          overflow: TextOverflow.fade,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text('\$ ${trips[index].Trip_price}')
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              itemCount: trips.length,
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
