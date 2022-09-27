import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rz_tours/providers/Trips_provider.dart';
import 'package:rz_tours/providers/cart_provider.dart';
import 'package:rz_tours/providers/chat_provider.dart';
<<<<<<< Updated upstream
import 'package:rz_tours/screens/Admin_Home.dart';
import 'package:rz_tours/screens/home.dart';
=======
import 'package:rz_tours/providers/product_provider.dart';
>>>>>>> Stashed changes
import 'package:rz_tours/screens/sign_in.dart';
import 'package:rz_tours/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
<<<<<<< Updated upstream
import 'package:flutter/services.dart' show rootBundle;
=======
import 'package:firebase_core/firebase_core.dart';

>>>>>>> Stashed changes

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
<<<<<<< Updated upstream
 //final data = rootBundle.load('assets/busStops.txt');
=======

>>>>>>> Stashed changes
}

//
class MyApp extends StatelessWidget {
  final _fbApp = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Cart()),
        ChangeNotifierProvider(create: (context) => TripsProvider()),
        ChangeNotifierProvider(create: (context) => ChatProvider()),
      ],
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        builder: () => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'RZ tours',
          theme: ThemeData(
            primaryColor: Constants.primaryColor,
            primarySwatch: Colors.grey,
            scaffoldBackgroundColor: Color.fromRGBO(247, 249, 255, 1),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: GoogleFonts.poppinsTextTheme(),
          ),
          home: SignIn(),
        ),
        
      ),
    );
  }
}
