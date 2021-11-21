import 'package:flutter/material.dart';
import 'package:rz_tours/screens/home.dart';
import 'package:rz_tours/screens/sign_in.dart';

class ForgetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                title: Text("Home"),
                onTap: ()=>Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context)=>Home()
                    )
                ),
              ),
              ListTile(
                title: Text("About Us"),
                onTap: ()=>Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context)=>SignIn()
                    )
                ),
              )
            ],
          ),
        ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              Text(
                "Forget Password",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30, width: 90),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: "Email"),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Send Email',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  void not() {
    print("notifications");
  }
}