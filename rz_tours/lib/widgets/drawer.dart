import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rz_tours/screens/Trips_home.dart';
import 'package:rz_tours/screens/forget_password.dart';
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
<<<<<<< Updated upstream
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
=======
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1485290334039-a3c69043e517?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTYyOTU3NDE0MQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=300'),
            ),
            accountEmail: Text(
              'kareem@gmail.com',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            accountName: Text(
              'Kareem Yasser',
              style: TextStyle(color: Colors.white, fontSize: 24.0),
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
              'Hotels',
              style: TextStyle(fontSize: 24.0),
            ),
            onTap: () {
              Helper.nextScreen(context, Trips_home());
            },
          ),
          ListTile(
            leading: const Icon(Icons.flight),
            title: const Text(
              'Trips',
              style: TextStyle(fontSize: 24.0),
            ),
            onTap: () {
              Helper.nextScreen(context, Trips_home());
            },
          ),
          ListTile(
            leading: const Icon(Icons.directions_boat),
            title: const Text(
              'Cruises',
              style: TextStyle(fontSize: 24.0),
            ),
            onTap: () {
              Helper.nextScreen(context, Trips_home());
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text(
              'Packages',
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
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.location_on_outlined),
            title: const Text(
              'Google Maps',
              style: TextStyle(fontSize: 24.0),
            ),
            onTap: () {
              //Helper.nextScreen(context, Maps());
              ;
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text(
              'Log out',
              style: TextStyle(fontSize: 24.0),
            ),
            onTap: () {
              Authentication().signOut();
              Helper.nextScreen(context, SignIn());
              ;
            },
          ),
        ],
      ),
    );
>>>>>>> Stashed changes
  }
}
