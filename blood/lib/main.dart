import 'package:blood/HomePage.dart';
import 'package:blood/LoginPage.dart';
import 'package:blood/SignupPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Homepage(),
    routes: {
      "home":(context)=>Homepage(),
      "login":(context)=>LoginPage(),
      "signup":(context)=>SignUp()
    },
  ));
}
