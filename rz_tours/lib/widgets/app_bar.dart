<<<<<<< Updated upstream
 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({Key? key}) : preferredSize = Size.fromHeight(60.0), super(key: key);

  @override
  final Size preferredSize;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar>{
=======
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TopBar extends StatelessWidget {
  String _title;

  TopBar([this._title = '']);
>>>>>>> Stashed changes

  @override
  Widget build(BuildContext context) {
    return AppBar(
<<<<<<< Updated upstream
      title: Text('RZ tours'),
 
    );
  }
}
=======
      title: Text(
        this._title,
      ),
      backgroundColor: Colors.amber,
      elevation: 0.0, //shadow of app bar
      centerTitle: true,
    );
  }
}
>>>>>>> Stashed changes
