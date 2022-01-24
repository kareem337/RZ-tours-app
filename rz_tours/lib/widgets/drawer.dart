import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rz_tours/screens/Trips_home.dart';
import 'package:rz_tours/screens/chat.dart';
import 'package:rz_tours/screens/home.dart';
import 'package:rz_tours/screens/rz_map.dart';
import 'package:rz_tours/screens/sign_in.dart';
import 'package:rz_tours/services/authentication.dart';
import 'package:rz_tours/utils/helper.dart';
import 'package:rz_tours/widgets/About_us.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user?.uid;
    final Stream<QuerySnapshot> snapshot = FirebaseFirestore.instance
        .collection('User_Details')
        .where('User_Id', isEqualTo: uid)
        .snapshots();
    return Drawer(
        child: StreamBuilder<QuerySnapshot>(
      stream: snapshot,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return Column(
              //  padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        data['Imagepath']),
                  ),
                  accountEmail: Text(
                    "${user?.email}",
                    style: TextStyle(color: Colors.white, fontSize: 24.0),
                  ),
                  accountName: Text(
                    "${data['First_Name'] + data['Last_Name']}",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.house),
                  title: const Text(
                    'Home',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  onTap: () {
                    Helper.nextScreen(context, Home());
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.apartment),
                  title: const Text(
                    'Museums',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  onTap: () {
                    Helper.nextScreen(context, Trips_home());
                  },
                ),
               
                ListTile(
                  leading: const Icon(Icons.info),
                  title: const Text(
                    'AboutUs',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  onTap: () {Helper.nextScreen(context, Aboutus());},
                ),
                ListTile(
                  leading: const Icon(Icons.map_outlined),
                  title: const Text(
                    'RzMap',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  onTap: () {
                    //Helper.nextScreen(context, RzMap());
                    
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text(
                    'Log out',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  onTap: () {
                    Authentication().signuutt();
                    Helper.nextScreen(context, SignIn());
                    ;
                  },
                ),
                
              ],
            );
          }).toList(),
        );
      },
    ));
  }
}
