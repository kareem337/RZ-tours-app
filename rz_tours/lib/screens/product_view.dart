import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rz_tours/screens/home.dart';
import 'package:rz_tours/widgets/app_bar.dart';
import 'package:rz_tours/widgets/custom_app_bar.dart';
import 'package:rz_tours/widgets/drawer.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(
        //bet7aded size lel appbar
        preferredSize: Size.fromHeight(50.0),
        child: CustomAppBar('Product'),
      ),
      drawer: DrawerWidget(),
      body: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        child: ListView(
          children: [
            Center(
              child: Text(
                "Egyptian Museum",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  fontFamily: "italic",
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/Trip-1.png"),
                  radius: 100,
                  // child: Image.network(
                  //   height: 150,
                  //   width: 100,
                  // ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Place:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Egyptian Musuem",
                        style: TextStyle(fontSize: 16, fontFamily: "italic"),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Picking Place:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "NasrCity,Cairo International Stadium",
                        style: TextStyle(fontSize: 16, fontFamily: "italic"),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Time:",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )),
                    Expanded(
                      child: Text(
                        "11:00 AM",
                        style: TextStyle(fontSize: 16, fontFamily: "italic"),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Date:",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )),
                    Expanded(
                      child: Text(
                        "1/12/2021",
                        style: TextStyle(fontSize: 16, fontFamily: "italic"),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home())),
                    child: Text(
                      "Go To Payement",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
