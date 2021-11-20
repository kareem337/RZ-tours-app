import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:srcflutter/animation_screen.dart';
import 'package:srcflutter/tagroba.dart';

class EditProfile extends StatefulWidget
{
  @override
  State<EditProfile> createState()=>_EditProfileState();

}

class _EditProfileState extends State<EditProfile>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text("Edit Profile Screen"),),
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                title: Text("Home"),
                onTap: ()=>Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context)=>Tagroba()
                    )
                ),
              ),
              ListTile(
                title: Text("About Us"),
                onTap: ()=>Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context)=>AnimatedContainerPage()
                    )
                ),
              )
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage("https://pyxis.nymag.com/v1/imgs/6ca/c27/d480ad69b8be1bff0dc381baefb2d41ac0-30-tim-cook.2x.h473.w710.jpg"),
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter First Name",
                labelText: "First Name",
                icon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Enter Last Name",
                  labelText: "Last Name",
                  icon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Enter Email Address",
                  labelText: "Email Address",
                  icon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Enter Password",
                  labelText: "Password",
                  icon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
              ),
              obscureText: true,
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(100,50)
                ),
                child: Text("Edit",style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),)

            )
          ],
        ),
    );
  }
}

