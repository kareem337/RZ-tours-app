import 'package:flutter/material.dart';
import 'package:rz_tours/widgets/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Product extends StatefulWidget {
  Product({Key? key}) : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Mueseums and trips',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 21.0,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('Products').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                
                padding: const EdgeInsets.all(16.0),
                itemCount: snapshot.data!.docs.length,
                 itemBuilder: (context, index) {
                    var temp = snapshot.data!.docs[index].data() as dynamic;
                    return
                  ProductItem(
                      'Tahrir museum.jpg', temp['name'], temp['price'], temp['description'],);
                 },
              );
            }));
  }
}
