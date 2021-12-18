import 'package:flutter/material.dart';
import 'package:rz_tours/screens/product_view.dart';
import 'package:rz_tours/screens/chat.dart';
import 'package:rz_tours/screens/home.dart';
import 'package:rz_tours/screens/edit_profile.dart';
import 'package:rz_tours/screens/products.dart';
import 'package:rz_tours/screens/sign_in.dart';
import 'package:rz_tours/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rz_tours/screens/filters.dart';
import 'package:rz_tours/screens/Trips_home.dart';
import 'package:rz_tours/screens/search_result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Constants.primaryColor,
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Color.fromRGBO(247, 249, 255, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: Home(),
    ),
    );
  }
}

