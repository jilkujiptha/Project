import 'package:authentication/HomePage.dart';
import 'package:authentication/LoginPage.dart';
import 'package:authentication/SignupPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
    routes: {
      "home":(context)=>HomePage(),
      "login":(Context)=>LoginPage(),
      "signup":(context)=>SignUp()
    },
  ));
}
