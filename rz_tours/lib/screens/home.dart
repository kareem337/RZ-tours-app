import 'package:flutter/material.dart';
import 'package:rz_tours/screens/home.dart';
import 'package:rz_tours/screens/products.dart';
import 'package:rz_tours/screens/sign_in.dart';
import 'package:rz_tours/widgets/button_bar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("RZ Tours"),
        ),
        bottomNavigationBar: Buttom(),
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                title: Text("Home"),
                onTap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home())),
              ),
              ListTile(
                title: Text("About Us"),
                onTap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignIn())),
              )
            ],
          ),
        ),
        body: ListView(children: [
          SafeArea(
              child: Column(
            children: [
              Container(
                  margin: EdgeInsets.all(30),
                  child: Text(
                    "Explore The Beauty Of Egypt",
                    style: TextStyle(
                        fontSize: 37,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Raleway"),
                  )),
              Container(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Image(
                        image: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMSSJnFuUQ4DqATJqDJV99xyYx4Z6QfFJjHg&usqp=CAU")),
                    Image(
                        image: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkY_jijp194fv3YodNkM-_kOsZ1_E0S6w4Ng&usqp=CAU")),
                    Image(
                        image: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFpdliLd-Zrx6hxBdCHvzb7kofJtYs3qkTHA&usqp=CAU")),
                    Image(
                        image: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFpdliLd-Zrx6hxBdCHvzb7kofJtYs3qkTHA&usqp=CAU"))
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.only(right: 200),
                  child: Text(
                    "See more",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey,
                            child: IconButton(
                              icon: Icon(
                                Icons.hotel,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Product()));
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Hotel",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey,
                            child: IconButton(
                              icon: Icon(
                                Icons.flight,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Product()));
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Trips",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey,
                            child: IconButton(
                              icon: Icon(
                                Icons.hotel,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Product()));
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Hotel",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey,
                            child: IconButton(
                              icon: Icon(
                                Icons.home,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Product()));
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Museum",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ))
        ]));
  }
}
