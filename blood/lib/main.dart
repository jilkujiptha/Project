import 'package:blood/DIsplay.dart';
import 'package:blood/HomePage.dart';
import 'package:blood/LoginPage.dart';
import 'package:blood/SignupPage.dart';
import 'package:blood/donorAdd.dart';
import 'package:blood/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    home: MainPage(),
    routes: {
      "home": (context) => Homepage(),
      "login": (context) => LoginPage(),
      "signup": (context) => SignUp(),
      "add": (context) => DonorAdd(),
      "display": (context) => Display(),
      "main": (context) => MainPage()
    },
  ));
}
