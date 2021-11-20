import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.power),
          title: Text("RZ Tours"),
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
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFpdliLd-Zrx6hxBdCHvzb7kofJtYs3qkTHA&usqp=CAU")),
                    Image(
                        image: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFpdliLd-Zrx6hxBdCHvzb7kofJtYs3qkTHA&usqp=CAU")),
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
                              onPressed: () {},
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
                                Icons.hotel,
                                color: Colors.white,
                              ),
                              onPressed: () {},
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
                  )
                ],
              ),
              SizedBox(height: 10,),
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
                              onPressed: () {},
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
                                Icons.hotel,
                                color: Colors.white,
                              ),
                              onPressed: () {},
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
                  )
                ],
              ),
              SizedBox(height: 5,),
              BottomNavigationBar(

                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                    backgroundColor: Colors.grey,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart),
                    label: 'Business',
                    backgroundColor: Colors.green,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.perm_phone_msg_sharp),
                    label: 'School',
                    backgroundColor: Colors.purple,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.message),
                    label: 'Settings',
                    backgroundColor: Colors.pink,
                  ),
                ],
                currentIndex: 0,
                selectedItemColor: Colors.amber[800],
              ),
            ],
          ))
        ]));
  }
}
