import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rz_tours/models/person_model.dart';
import 'package:rz_tours/screens/forget_password.dart';
import 'package:rz_tours/screens/home.dart';
import 'package:rz_tours/screens/sign_in.dart';
import 'package:rz_tours/services/authentication.dart';
import 'package:rz_tours/utils/helper.dart';
import 'package:rz_tours/validations/validations_functions.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _LastNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
                appBar: AppBar(
          title: Text('SignUp'),
          backgroundColor: Colors.amber,
          elevation: 0.0,
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Form(
              key: _formKey,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
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
                      controller: _firstNameController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'FirstName',
                          hintText: "FirstName"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Your FirstName";
                        }
                        if (!checkString(value)) {
                          return "Wrong Letter Strings ";
                        }
                        if (!isLength(value))
                          return "Please Enter 3 Letters Or More";

                        return null;
                      },
                    ),
                    SizedBox(height: 30, width: 90),
                    TextFormField(
                      controller: _LastNameController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'LastName',
                          hintText: "LasttName"),
                      validator: (value) {
                        if (!isNull(value!)) return "Text Is Empty";
                        if (!checkString(value)) return "Please Enter Letters";
                        if (!isLength(value))
                          return "Please Enter 3 Letters Or More";
                        return null;
                      },
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
                    SizedBox(height: 15),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.amber),
                      onPressed: () async {
                        print("Signup Pressed");
                        print("The Email is: ${_emailController.text}");
                        // Respond to button press
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          var userrr = FirebaseAuth.instance.currentUser;
                          var cuid = userrr?.uid;
                          final list = await FirebaseAuth.instance
                              .fetchSignInMethodsForEmail(
                                  _emailController.text);
                          if (list.isNotEmpty) {
                            Helper.nextScreen(context, SignUp());
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      'Failed To SignUp Email Already in use')),
                            );
                          } else {
                            await Authentication().Signup(
                                _firstNameController.text,
                                _LastNameController.text,
                                _emailController.text,
                                _passwordController.text,
                                "");
                            Helper.nextScreen(context, Home());
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('SignedUp Successfuly')),
                            );
                          }
                        }
                      },
                      child: Text(
                        'Signup',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(width: 25),
                        Text(
                          "Already have an account?",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {
                            Helper.nextScreen(context, SignIn());
                          },
                          child: Text(
                            "LogIn",
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
            )
          ],
        ));
  }
}
