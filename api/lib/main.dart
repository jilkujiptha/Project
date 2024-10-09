import 'package:api/cartPage.dart';
import 'package:api/firstPage.dart';
import 'package:api/secondPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MainPage(),
  routes: {
    "first":(context)=>MainPage(),
    "second":(context)=>TouchPage(),
    "third":(context)=>CartPage()
  },
  ));
}
