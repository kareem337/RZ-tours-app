import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rz_tours/utils/Store.dart';
import 'package:rz_tours/widgets/admin_Drawer.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  final _store = Store();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Orders',
            style: TextStyle(color: Colors.black),
          ),
        ),
        drawer: MobileDrawer(),
        body: Container(
          child: StreamBuilder(
              stream: _store.loadorders(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (!streamSnapshot.hasData) {
                  print("object");
                  return Center(child: Text("No items"));
                }
                return ListView.builder(
                    itemCount: streamSnapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, index) {
                      return Container(
                          child: SingleChildScrollView(
                        child: Card(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                leading: Icon(Icons.account_circle_rounded,
                                    size: 50),
                                title: Text(
                                    'User Name:${streamSnapshot.data!.docs[index]["User Name"]}  '),
                                subtitle: Text(
                                    'Musume Reserved : ${streamSnapshot.data!.docs[index]["Order name"]}'),

                                isThreeLine: true,
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Column(
                                      children: [
                                        
                                             Text("Quantity:${streamSnapshot.data!.docs[index]
                                            ["Quantity"].toString()}"),
                                            Text("price ${streamSnapshot.data!.docs[index]
                                            ["Total price"].toString()}")

                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ));
                    });
              }),
        ));
  }
}
