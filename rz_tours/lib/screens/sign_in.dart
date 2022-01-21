import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rz_tours/models/person_model.dart';
import 'package:rz_tours/screens/Admin_Home.dart';
import 'package:rz_tours/screens/forget_password.dart';
import 'package:rz_tours/screens/home.dart';
import 'package:rz_tours/screens/sign_up.dart';
import 'package:rz_tours/services/authentication.dart';
import 'package:rz_tours/utils/helper.dart';
import 'package:rz_tours/validations/validations_functions.dart';
import 'package:rz_tours/widgets/custom_app_bar.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: CustomAppBar('Sign In'),
      ),
      body: ListView(children: [
        Form(
          key: _formKey,
          child: Container(
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
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: "Email"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Your E-Mail";
                    }
                    if (!isEmail(value)) {
                      return "Ivalid Email Please Re-Enter The Email ";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (!isNull(value!)) {
                      return "Password Is Empty";
                    }
                    if (!isPassword(value)) {
                      return "Invalid Password";
                    }
                    return null;
                  },
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText:
                          "one small letter & one capital & >5 characters "),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(children: [
                  SizedBox(width: 220),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgetPassword(),
                          ));
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
                    print("Login Pressed");
                    print("The Email is: ${_emailController.text}");
                    // Respond to button press

                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.

                      Authentication().Signin(
                          email: _emailController.text,
                          password: _passwordController.text);
                      if (FirebaseFirestore.instance
                              .collection('User_Details')
                              .doc('User_Type') ==
                          1) {
                        Helper.nextScreen(context, Home());
                      } else {
                        Helper.nextScreen(context, Admin_HomeScreen());
                      }
                    }
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
                    SizedBox(width: 20),
                    Text(
                      "Don't have an account?",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {
                        Helper.nextScreen(context, SignUp());
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
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

void not() {
  print("notifications");
}


/*
alignment: Alignment.center,
margin: EdgeInsets.only(bottom:400) ,
alignment: Alignment.center,
margin: EdgeInsets.only(bottom:400) ,

 */


/*
alignment: Alignment.center,
margin: EdgeInsets.only(bottom:400) ,
alignment: Alignment.center,
margin: EdgeInsets.only(bottom:400) ,

 */

// class GetData extends StatelessWidget {
//   const GetData({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return return StreamBuilder<QuerySnapshot>(
//       stream: snapshot,
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Text('Something went wrong');
//         }

//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Text("Loading");
//         }

//         return Scaffold(
//           body: ListView(
//             children: snapshot.data!.docs.map((DocumentSnapshot document) {
//               Map<String, dynamic> data =
//                   document.data()! as Map<String, dynamic>;
//               return Column(
//                 // title: Text(data['First_Name']),
//                 // subtitle: Text(data['Last_Name']),
//                 children: [
//                   TextFormField(
//                     initialValue: data['First_Name'],
//                     onChanged: (value) {
//                       fn = value;
//                     },
//                   ),
//                   SizedBox(
//                     height: 50,
//                   ),
//                   TextFormField(
//                     initialValue: data['Last_Name'],
//                     onChanged: (value) {
//                       ln = value;
//                     },
//                   ),
//                   SizedBox(
//                     height: 50,
//                   ),
//                   TextFormField(
//                     initialValue: user?.email,
//                     onChanged: (value) {
//                       //ln = value;
//                     },
//                   ),
//                   ElevatedButton(
//                       onPressed: () {
//                         applyChanges();
//                       },
//                       child: Text("Edit Profile"))
//                 ],
//               );
//             }).toList(),
//           ),
//         );
//       },
//     );

//     //print(userr);
//   }
// }
//   }
// }