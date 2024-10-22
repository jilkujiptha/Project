import 'package:flutter/material.dart';
import 'package:olx/OLX/SignInPage.dart';
import 'package:olx/OLX/SignupPage.dart';
import 'package:olx/OLX/homePage.dart';
void main(){
  runApp(MaterialApp(home: SignIn(),
  routes: {
    "homepage":(context)=>Homepage(),
    "signin":(context)=>SignIn(),
    "signup":(context)=>SignUp()
  },
  ));
}