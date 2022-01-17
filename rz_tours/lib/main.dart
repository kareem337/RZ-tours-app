import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rz_tours/providers/cart_provider.dart';
import 'package:rz_tours/screens/sign_in.dart';
import 'package:rz_tours/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider (
      
      create: (context) =>  Cart(),
      child:
      ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Constants.primaryColor,
          primarySwatch: Colors.grey,
          scaffoldBackgroundColor: Color.fromRGBO(247, 249, 255, 1),
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        home: SignIn(),
        ),
    )
    );
    

  }
}
