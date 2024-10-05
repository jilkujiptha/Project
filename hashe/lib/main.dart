import 'package:flutter/material.dart';
import 'package:hashe/Hashe/homePage.dart';
import 'package:hashe/Hashe/loginPage.dart';
import 'package:hashe/Hashe/signupPage.dart';

void main() {
  runApp(MaterialApp(
    home: SignupPage(),
    routes: {
      "home": (context) => HomePage(),
      "login": (context) => LoginPage(),
      "signup": (context) => SignupPage(),
    },
  ));
}
