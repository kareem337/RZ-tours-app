import 'package:flutter/material.dart';
import 'package:rz_tours/screens/Trips_home.dart';
import 'package:rz_tours/screens/chat.dart';
import 'package:rz_tours/screens/edit_profile.dart';
import 'package:rz_tours/screens/home.dart';
import 'package:rz_tours/screens/home_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  int _index = 0;
  List<Widget> screens = [
    HomeScreen(),
    Chat(),
    Trips_home(),
    EditProfile(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _index,
          onTap: (value) {
            setState(() {
              _index = value;
            });
          },
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: Text("Home"),
              selectedColor: Colors.amber,
            ),

            /// Contact Us
            SalomonBottomBarItem(
              icon: Icon(Icons.contact_support),
              title: Text("Contact Us"),
              selectedColor: Colors.amber,
            ),

            /// About Us
            SalomonBottomBarItem(
              icon: Icon(Icons.info),
              title: Text("About Us"),
              selectedColor: Colors.amber,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: Icon(Icons.person),
              title: Text("Profile"),
              selectedColor: Colors.amber,
            ),
          ],
        ),
        body: SafeArea(child:  screens[_index],)
        );
  }
}
