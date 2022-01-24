import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:rz_tours/services/authentication.dart';
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
  final _picker = ImagePicker();
  final Imagecontroller = TextEditingController();
  File? _image;
   String url="";
var img = Authentication();

  @override
  Widget build(BuildContext context) {
    
    Future<Uri?> getImage() async {
 
 
      //var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
       _image = File(pickedFile!.path);
        print('Image Path $_image');
        final name = basename(pickedFile.path);
    Reference storageReference =
        FirebaseStorage.instance.ref().child("Profile Images/$name");
    final UploadTask uploadTask =
        storageReference.putFile(File(pickedFile.path));
    final TaskSnapshot downloadUrl = (await uploadTask);
    url = await downloadUrl.ref.getDownloadURL();
    }

    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user?.uid;
    final Stream<QuerySnapshot> snapshot = FirebaseFirestore.instance
        .collection('User_Details')
        .where('User_Id', isEqualTo: uid)
        .snapshots();
    //final _formKey = GlobalKey<FormState>();
    _lastName.text = "";
    _firstName.text = "";
    // TODO: implement build
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: CustomAppBar('Profile'),
        ),
        drawer: DrawerWidget(),
        body: StreamBuilder<QuerySnapshot>(
          stream: snapshot,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                _firstName.text = data['First_Name'];
                _lastName.text = data['Last_Name'];
                return SafeArea(
                    child: Form(
                  key: _editFormKey,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                              child: (_image != null)
                                  ? Image.file(
                                      _image!,
                                      fit: BoxFit.fill,
                                    )
                                  : Image.network (
                                      "https://pyxis.nymag.com/v1/imgs/6ca/c27/d480ad69b8be1bff0dc381baefb2d41ac0-30-tim-cook.2x.h473.w710.jpg",
                                      fit: BoxFit.fill,
                                    ),
                            ),
                          
                        
Padding(
                    padding: EdgeInsets.only(top: 60.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.camera,
                        size: 30.0,
                      ),
                      onPressed: () {
                        getImage();
                      },
                    ),
                  ),

                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (!isNull(value!)) {
                              value = data['First_Name'];
                              return "Text Is Empty";
                            }
                            if (!checkString(value))
                              return "Please Enter Letters";
                            if (!isLength(value))
                              return "Please Enter 3 Letters Or More";
                            return null;
                          },

                          controller: _firstName,
                          //initialValue: data['First_Name'],
                          decoration: InputDecoration(
                              icon: Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _lastName,
                          validator: (value) {
                            if (!isNull(value!)) {
                              value = data['Last_Name'];
                              return "Text Is Empty";
                            }
                            if (!checkString(value))
                              return "Please Enter Letters";
                            if (!isLength(value))
                              return "Please Enter 3 Letters Or More";
                            return null;
                          },
                          // initialValue: data['Last_Name'],
                          decoration: InputDecoration(
                              hintText: "Enter Last Name",
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
                              value = user?.email;
                              return "Please Enter Your E-mail";
                            }
                            if (!isEmail(value)) {
                              return "Ivalid Email Please Re-Enter The Email ";
                            }
                            return null;
                          },
                          initialValue: user?.email,
                          decoration: InputDecoration(
                              //hintText: "Enter Email Address",
                              icon: Icon(Icons.email),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              if (_editFormKey.currentState!.validate()) {
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.
                                await FirebaseFirestore.instance
                                    .collection('User_Details')
                                    .doc(uid)
                                    .update({
                                  'First_Name': _firstName.text,
                                  'Last_Name': _lastName.text,
                                  'Imagepath':url,

                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Edited Succeffuly')),
                                );
                                print("Updated");
                              }
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Constants.amberColor,
                                ),
                                minimumSize:
                                    MaterialStateProperty.all(Size(100, 50))),
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
                ));
              }).toList(),
            );
          },
        ));
  }
}
