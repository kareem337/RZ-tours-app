// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
// import 'package:flutter/material.dart';
// import 'package:rz_tours/screens/home.dart';
// import 'package:rz_tours/screens/sign_in.dart';
// import 'package:intl/intl.dart';

// class ForgetPassword extends StatelessWidget {
//     late DateTime date;
//   final format = DateFormat("yyyy-MM-dd HH:mm");
//   late DateTime dt;
//   late Timestamp myTimeStamp;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         drawer: Drawer(
//           child: ListView(
//             children: [
//               ListTile(
//                 title: Text("Home"),
//                 onTap: ()=>Navigator.push(context,
//                     MaterialPageRoute(
//                         builder: (context)=>Home()
//                     )
//                 ),
//               ),
//               ListTile(
//                 title: Text("About Us"),
//                 onTap: ()=>Navigator.push(context,
//                     MaterialPageRoute(
//                         builder: (context)=>SignIn()
//                     )
//                 ),
//               )
//             ],
//           ),
//         ),
//       body:   ListView(
      
//         children:[ 
          
//           SizedBox(height: 200,),
//           Column(
          
//                           children: <Widget>[
//                           Text('Choose Date and time (${format.pattern})'),
//                           DateTimeField(
                      
//                             format: format,
//                             onShowPicker: (context, currentValue) async {
//                               final date = await showDatePicker(
                                
//                                   context: context,
//                                   firstDate: DateTime(1900),
//                                   initialDate: currentValue ?? DateTime.now(),
//                                   lastDate: DateTime(2100));
//                               if (date != null) {
//                                 final time = await showTimePicker(
//                                   context: context,
//                                   initialTime:
//                                       TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                                      
//                                 );
                                
//                                 dt= DateTimeField.combine(date, time);
//                                 // var a = dt.runtimeType;
                                
//                                 // debugPrint("$a");
//                                 return dt;
                                
//                               } else {
//                                 return currentValue;
//                               }
                              
//                             },
//                           ),]
//           ),]
//       ));
//   }

//   void not() {
//     print("notifications");
//   }
// }