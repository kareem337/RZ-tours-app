// import 'dart:html';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:rz_tours/models/Trips.dart';
// import 'package:rz_tours/utils/Store.dart';
// import 'package:rz_tours/utils/constants.dart';
// class MyDatatable extends StatefulWidget {
//   @override
//   _MyDatatableState createState() => _MyDatatableState();
// }

// class _MyDatatableState extends State<MyDatatable> {
//   final Store _store = Store();
  
//   @override
//   Widget build(BuildContext context) {
    
//     return  StreamBuilder<QuerySnapshot>(
       
//       stream: _store.loadTrips() ,
//       builder: (context, snapshot) {
//         if(snapshot.hasData){
//           List<Trip> trips=[];
//       for(var doc in snapshot.data!.docs)
//      {
//        var data = doc.data() as dynamic;
//        //var data = snapshot.data!.docs;
       
//        trips.add(Trip(
//        museum_name: data[museum_name],
//        Trip_description: data[Trip_description],
//        Location: data[Location],
//        Trip_price: data[Trip_price],
//        imagePath: data[imagePath],
//        liked:false, 
//        Trip_Types: Trips.OUT_OF_CAIRO
//        ),
//        );
      
      
//      }
     
//     return Column(
//       children: <Widget>[
//         Expanded(
//               flex: 8,
//               child: Container(
//                 padding: EdgeInsets.all(10),
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//         child: DataTable(
                  
//                   columns: const <DataColumn>[
//                     DataColumn(
//                       label: Text(
//                         'Name',
//                         style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     DataColumn(
//                       label: Text(
//                         'Price',
//                         style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     DataColumn(
//                       label: Text(
//                         'Catrogry',
//                         style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                             DataColumn(
//                       label: Text(
//                         'Seller',
//                         style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                    DataColumn(
//                       label: Text(
//                         'Buyer',
//                         style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                      DataColumn(
//                       label: Text(
//                         'Time',
//                         style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ],
                      
//                   rows: 
//                   <DataRow>
//                  // .g(trips.length,(index) =>
//                   [
//                     DataRow(
//                       cells: <DataCell>[
//                         DataCell(Text("")),
//                         DataCell(Text('3.99')),
//                         DataCell(Text('Plus')),
//                         DataCell(Text('Hamouda')),
//                         DataCell(Text('John')),
//                         DataCell(Text('19:30')),
//                       ],
//                     ),
                    
//                   ],
       
//                 );
      

                
                  
          
//       };
//       }
//     );
      
//   }
// }