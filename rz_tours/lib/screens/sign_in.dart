import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rz_tours/screens/forget_password.dart';
import 'package:rz_tours/screens/home.dart';
class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar( title: Text("RZ tours "), actions: [

      ]),
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
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            Text(
              "RZ Tours",
              style: TextStyle(
                fontSize: 50,
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
            SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: "Password"),
            ),
            SizedBox(height: 10),
            Row(children: [
              SizedBox(width: 220),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPassword(),));
                },
                child: Text(
                  "Forget Password?",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ]),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                // Respond to button press
              },
              child: Text(
                'Login',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 40),
                Text(
                  "Don't have an account?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    // Respond to button press
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void not() {
    print("notifications");
  }
}

/*
alignment: Alignment.center,
margin: EdgeInsets.only(bottom:400) ,
alignment: Alignment.center,
margin: EdgeInsets.only(bottom:400) ,

 */
