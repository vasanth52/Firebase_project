// import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/authentication/email/login_screen.dart';
import 'package:firebase_project/streambuilder.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phnController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  final firestore = FirebaseFirestore.instance;
  get data => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home page"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const login_screen()));
              },
              icon: Icon(Icons.logout_outlined),
            )
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    'Insert user Details',
                    style: TextStyle(fontSize: 28),
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    controller: nameController,
                    maxLength: 15,
                    decoration: InputDecoration(
                        labelText: 'Name', border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Age', border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        labelText: 'email', border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  //  TextFormField(
                  //    controller: adController,
                  //    decoration: InputDecoration(
                  //        labelText: 'Address', border: OutlineInputBorder()),
                  //  ),
                  //  SizedBox(
                  //    height: 15,
                  //  ),
                  TextFormField(
                    controller: phnController,
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Phone No.', border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (nameController.text.isNotEmpty &&
                          ageController.text.isNotEmpty &&
                          emailController.text.isNotEmpty &&
                          //adController.text.isNotEmpty &&
                          phnController.text.isNotEmpty) {
                        firestore.collection("users").add({
                          "Name": nameController.text,
                          "Age": ageController.text,
                          "email": emailController.text,
                          //"Address.": adController.text,
                          "Phone No.": phnController.text
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => streanbuilder()));
                      }
                    },
                    child: Text(
                      "Submit Details",
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
