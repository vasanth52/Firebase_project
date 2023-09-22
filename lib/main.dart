//import 'dart:js_interop';
// import 'dart:math';
import 'firebase_options.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_project/authentication/email/login_screen.dart';
import 'package:firebase_project/home_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // FirebaseFirestore.instance
  //     .collection('users')
  //     .get()
  //     .then((QuerySnapshot querySnapshot) {
  //   querySnapshot.docs.forEach((doc) {
  //     print(doc["first_name"]);
  //   });
  // });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  // final firestore = FirebaseFirestore.instance;
  // get data => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: (FirebaseAuth.instance.currentUser != null)
          ? homescreen()
          : login_screen(),
    );
  }
}
