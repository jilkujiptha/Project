import 'package:active/mainPage.dart';
import 'package:active/secondPage.dart';
import 'package:flutter/material.dart';
void main(){
   runApp(MaterialApp(home: MainPage(),
   routes: {
    "first":(context)=>MainPage(),
    "second":(context)=>SecondPage()
   },
   ));
}