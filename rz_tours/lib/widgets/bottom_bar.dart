import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      currentIndex: _SelectedTab.values.indexOf(_selectedTab),
      onTap: _handleIndexChanged,
      items: [
        /// Home
        SalomonBottomBarItem(
          icon: const Icon(Icons.home),
          title: Text("Home"),
          selectedColor: Colors.orange,
        ),

        /// Likes
        SalomonBottomBarItem(
          icon: Icon(Icons.favorite_border),
          title: Text("Abut Us"),
          selectedColor: Colors.orange,
        ),

        /// Search
        SalomonBottomBarItem(
          icon: Icon(Icons.search),
          title: Text("Blog"),
          selectedColor: Colors.orange,
        ),

        /// Profile
        SalomonBottomBarItem(
          icon: Icon(Icons.person),
          title: Text("Profile"),
          selectedColor: Colors.orange,
        ),
      ],
    );
  }
}

enum _SelectedTab { home, likes, search, profile }
