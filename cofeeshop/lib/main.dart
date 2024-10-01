import 'package:cofeeshop/coffee/CartPage.dart';
import 'package:cofeeshop/coffee/HomePage.dart';
import 'package:cofeeshop/coffee/ShopPage.dart';
import 'package:cofeeshop/coffee/firstPage.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: MainPage(),
  routes: {
    "main":(context)=>MainPage(),
    "cart":(context)=>CartPage(),
    "shop":(context)=>ShoPage(),
    "home":(context)=>HomePage()
  },
  ));
}