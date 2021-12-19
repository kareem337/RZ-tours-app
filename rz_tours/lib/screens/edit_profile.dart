import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rz_tours/utils/constants.dart';
import 'package:rz_tours/validations/validations_functions.dart';
import 'package:rz_tours/widgets/custom_app_bar.dart';
import 'package:rz_tours/widgets/drawer.dart';

class EditProfile extends StatefulWidget {
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _editFormKey = GlobalKey<FormState>();
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
          appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: CustomAppBar('Profile'),
      ),
      drawer: DrawerWidget(),
       body: SafeArea(
         child: Form(
          key: _editFormKey,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        "https://pyxis.nymag.com/v1/imgs/6ca/c27/d480ad69b8be1bff0dc381baefb2d41ac0-30-tim-cook.2x.h473.w710.jpg"),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (!isNull(value!)) return "Text Is Empty";
                    if (!checkString(value)) return "Please Enter Letters";
                    if (!isLength(value)) return "Please Enter 3 Letters Or More";
                    return null;
                  },
                  controller: _firstName,
                  decoration: InputDecoration(
                      hintText: "Enter First Name",
                      labelText: "First Name",
                      icon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (!isNull(value!)) return "Text Is Empty";
                    if (!checkString(value)) return "Please Enter Letters";
                    if (!isLength(value)) return "Please Enter 3 Letters Or More";
                    return null;
                  },
                  controller: _lastName,
                  decoration: InputDecoration(
                      hintText: "Enter Last Name",
                      labelText: "Last Name",
                      icon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Your E-mail";
                    }
                    if (!isEmail(value)) {
                      return "Ivalid Email Please Re-Enter The Email ";
                    }
                    return null;
                  },
                  controller: _email,
                  decoration: InputDecoration(
                      hintText: "Enter Email Address",
                      labelText: "Email Address",
                      icon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                   validator: (value) {
                      if (!isNull(value!)) {
                        return "Password Is Empty";
                      }
                      if (!isPassword(value)) {
                        return "Invalid Password";
                      }
                      return null;
                    },
                  controller: _password,
                  decoration: InputDecoration(
                      hintText: "one small letter & one capital & >6 characters ",
                      labelText: "Password",
                      icon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                  obscureText: true,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_editFormKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Edited Succeffuly')),
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                              Constants.amberColor,
                            ),
                      minimumSize: MaterialStateProperty.all(Size(100, 50))
                    ), 
                    
                    child: Text(
                      "Edit",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ))
              ],
            ),
          ),
             ),
       ),
    );
  }
}
