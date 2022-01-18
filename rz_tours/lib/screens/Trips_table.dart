// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:rz_tours/models/Trips.dart';
// import 'package:rz_tours/utils/Store.dart';
// import 'package:rz_tours/utils/constants.dart';
// import 'package:rz_tours/utils/helper.dart';
// import 'package:rz_tours/widgets/ScrollableWidget.dart';

// class EditablePage extends StatefulWidget {
//   @override
//   _EditablePageState createState() => _EditablePageState();
// }

// class _EditablePageState extends State<EditablePage> {
// final Store _store = Store();

//   //List<Trip>? get trip => null;

//   @override
//   Widget build(BuildContext context) 
//   => Scaffold(
//         body: StreamBuilder<QuerySnapshot>(
//                stream: _store.loadTrips() ,
//       builder: (context, snapshot){
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
//             ScrollableWidget(child: buildDataTable());
//         };
//       } 
//         ),
//       );

//   Widget buildDataTable() {
//     final columns = ['museum name', 'Trip description', 'Trip price'];
    
//     return DataTable(
//       columns: getColumns(columns),
//       rows: getRows(trip),
//     );
//   }

//   List<DataColumn> getColumns(List<String> columns) {
//     return columns.map((String column) {
//       final isAge = column == columns[2];

//       return DataColumn(
//         label: Text(column),
//         numeric: isAge,
//       );
//     }).toList();
//   }

//   List<DataRow> getRows(List<Trip> trip) => trip.map((Trip trips) {

//         final cells = [trips.museum_name, trips.Trip_description, trips.Trip_price];

//         return DataRow(
//           cells: Utils.modelBuilder(cells, (index, cell) {
//             final showEditIcon = index == 0 || index == 1;

//             return DataCell(
//               Text('$cell'),
//               showEditIcon: showEditIcon,
//               onTap: () {
//                 }
//             );
//           }),
//         );
//       }).toList();

  
//   }
